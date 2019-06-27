

import Foundation

struct Local: Codable {
    var id: Int
    var address: String?
    var districtId: Int?
    var provinceId: Int?
    var departmentId: Int?
    var providerId: Int?
    var punctuation: Int?
    var status: String?
    var telefono: String?
    enum CodingKeys: String, CodingKey {
        case id = "LocalId"
        case address = "Address"
        case districtId = "DistrictId"
        case provinceId = "ProvinceId"
        case departmentId = "DepartmentId"
        case providerId = "ProviderId"
        case punctuation = "Punctuation"
        case status = "Status"
        case telefono = "Telefono"
    }
}
