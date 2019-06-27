
import Foundation

struct PostClientResponse: Codable {
    var data: Client
    var error: Bool
    var message: String?
    enum CodingKeys: String, CodingKey {
        case data = "Data"
        case error = "Error"
        case message = "Message"
    }
}
