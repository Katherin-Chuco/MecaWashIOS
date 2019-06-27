
import UIKit
import os
private let reuseIdentifier = "ServiceCell"

class ServicesViewController: UITableViewController {
    var services: [Service] = [Service]()
    var currentRow: Int = 0
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateData()
    }
    
    func updateData() {
        let url = MecaWashApi.getServices(id: 1)
        let token = "Bearer " + (UserDefaults.standard.string(forKey: "customerToken") ?? "no token")
        
        MecaWashApi.servicesRequest(key: token, url: url, responseHandler: handleResponse, errorHandler: handleError)
    }
    
    func handleResponse(response: GetServicesResponse) {
        guard let services = response.services else {
            self.services = [Service]()
            return
        }
        
        self.services = services
        self.tableView.reloadData()
    }
    
    func handleError(error: Error) {
        let message = "Error while requesting Services:\(error.localizedDescription)"
        os_log("%@", message)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return services.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ServiceCell
        
        cell.update(from: services[indexPath.row])
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentRow = indexPath.row
        
        performSegue(withIdentifier: "showService", sender: self)
    }
}
