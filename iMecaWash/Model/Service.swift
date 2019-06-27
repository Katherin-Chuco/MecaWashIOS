
import Foundation

struct Service: Codable{
    var id: Int
    var name: String?
    var detail: String?
    var localId: Int?
    var urlPhoto: String?
    var category: String?
    var nameCategory: Int?
    var cost: Double?
    var status: String?
    enum CodingKeys: String, CodingKey {
        case id = "ServiceId"
        case name = "Name"
        case detail = "Detail"
        case localId = "LocalId"
        case urlPhoto = "UrlPhoto"
        case category = "Category"
        case nameCategory = "NameCategory"
        case cost = "Cost"
        case status = "Status"
    }
}
