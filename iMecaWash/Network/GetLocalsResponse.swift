
import Foundation

struct GetLocalsResponse: Codable {
    var locals: [Local]?
    var error: Bool
    var message: String?
    enum CodingKeys: String, CodingKey {
        case locals = "Data"
        case error = "Error"
        case message = "Message"
    }
}
