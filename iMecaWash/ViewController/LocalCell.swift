
import UIKit

class LocalCell: UITableViewCell {
    
    @IBOutlet weak var providerNameLabel: UILabel!
    @IBOutlet weak var localDirectionLabel: UILabel!
    
    var local: Local?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func update(from local: Local){
        self.local = local
        self.providerNameLabel.text = "Spa Car"
        self.localDirectionLabel.text = local.address
    }
}
