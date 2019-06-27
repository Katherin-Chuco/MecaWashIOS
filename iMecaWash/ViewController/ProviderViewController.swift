
import UIKit
import os
private let reuseIdentifier = "ServiceCell"

class ProviderViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var servicesTableView: UITableView!
    
    var services: [Service] = [Service]()
    var currentRow: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        servicesTableView.delegate = self
        servicesTableView.dataSource = self
        
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
        self.servicesTableView.reloadData()
        
    }
    
    func handleError(error: Error) {
        let message = "Error while requesting Services:\(error.localizedDescription)"
        os_log("%@", message)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return services.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ServiceCell
        
        cell.update(from: services[indexPath.row])
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentRow = indexPath.row
        
        performSegue(withIdentifier: "showService", sender: self)
    }
}
