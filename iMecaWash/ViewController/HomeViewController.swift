
import UIKit
import os

class HomeViewController: UIViewController {
    @IBOutlet weak var tokenLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tokenLabel.text = UserDefaults.standard.string(forKey: "customerToken") ?? "no token"
        // Do any additional setup after loading the view.
    }
    
    
}
