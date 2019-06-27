
import UIKit
import os

class LoginClientViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func login(_ sender: UIButton) {
        let username = "chemalonso96" //usernameTextField.text
        let password = "12345678" //passwordTextfield.text
        
        MecaWashApi.loginClient(username: username, password: password, responseHandler: handleResponse(response:), errorHandler: handleError(error:))
    }
    
    func handleResponse(response: PostClientResponse) {
        
        let token = response.data.token
        let id = response.data.id
        
        UserDefaults.standard.set(token, forKey: "customerToken")
        UserDefaults.standard.set(id, forKey: "customerId")
        
        os_log("%@", token)
    }
    
    func handleError(error: Error) {
        let message = "Error while requesting login:\(error.localizedDescription)"
        os_log("%@", message)
    }

}
