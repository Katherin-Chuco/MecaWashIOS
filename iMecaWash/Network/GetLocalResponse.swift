
import Foundation

struct GetLocalResponse: Codable {
    var data: Local
    var error: Bool
    var message: String?
    enum CodingKeys: String, CodingKey {
        case data = "Data"
        case error = "Error"
        case message = "Message"
    }
}
