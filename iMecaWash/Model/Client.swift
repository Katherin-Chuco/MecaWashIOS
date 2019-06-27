
import Foundation

struct Client: Codable {
    var name: String
    var id: Int
    var token: String
    enum CodingKeys: String, CodingKey {
        case name = "Nombre"
        case id = "CustomerId"
        case token = "Token"
    }
}
