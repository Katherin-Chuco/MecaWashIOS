
import UIKit
import os
private let reuseIdentifier = "Cell"

class LocalsViewController: UITableViewController {
    var locals: [Local] = [Local]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateData()
    }
    
    func updateData() {
        let url = MecaWashApi.getLocals(id: 1)
        let token = "Bearer " + (UserDefaults.standard.string(forKey: "customerToken") ?? "no token")
        
        MecaWashApi.localsRequest(key: token, url: url, responseHandler: handleResponse, errorHandler: handleError)
    }
    
    func handleResponse(response: GetLocalsResponse) {
        guard let locals = response.locals else {
            self.locals = [Local]()
            return
        }
        
        self.locals = locals
        self.tableView.reloadData()
    }
    
    func handleError(error: Error) {
        let message = "Error while requesting Articles:\(error.localizedDescription)"
        os_log("%@", message)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! LocalCell
        
        cell.update(from: locals[indexPath.row])
        
        return cell
        
    }
}

