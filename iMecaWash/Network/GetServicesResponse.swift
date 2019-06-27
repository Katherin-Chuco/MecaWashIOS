
import Foundation

struct GetServicesResponse: Codable {
    var services: [Service]?
    var error: Bool
    var message: String?
    enum CodingKeys: String, CodingKey {
        case services = "Data"
        case error = "Error"
        case message = "Message"
    }
}
