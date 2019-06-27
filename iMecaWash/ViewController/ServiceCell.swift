
import UIKit

class ServiceCell: UITableViewCell {
    
    
    @IBOutlet weak var serviceNameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    
    var service: Service?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func update (from service: Service) {
        self.service = service
        
        self.serviceNameLabel.text = service.name
        self.categoryLabel.text = service.nameCategory
        self.costLabel.text = service.cost?.description
    }
}

