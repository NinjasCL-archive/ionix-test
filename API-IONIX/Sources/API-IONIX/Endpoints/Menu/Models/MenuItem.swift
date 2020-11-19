/**
 Example JSON
 ```json
 [{
     "title": "Hello",
     "fa_id": "fa-car"
 }]
 ```
 */

// MARK: - MenuItem

public struct MenuItemElement: Codable {
    let title, id: String?
    let sort: UInt?

    enum CodingKeys: String, CodingKey {
        case title
        case id = "fa_id"
        case sort
    }
}

public typealias MenuItem = [MenuItemElement]
