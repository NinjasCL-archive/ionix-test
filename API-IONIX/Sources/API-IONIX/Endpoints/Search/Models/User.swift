// used https://app.quicktype.io/ for quickly parsing the json
/**
 Example JSON
 ```json
 {"responseCode":0,"description":"OK","result":{"items":[{"name":"John","detail":{"email":"jdoe@gmail.com","phone_number":"+130256897875"}},{"name":"Anna","detail":{"email":"asmith@gmail.com","phone_number":"+5689874521"}},{"name":"Peter","detail":{"email":"pjones@gmail.com","phone_number":"+668978542365"}}]}}
 ```
 */
import Foundation

// MARK: - User

public struct User: Codable {
    public let responseCode: Int?
    public let responseDescription: String?
    public let result: Result?

    enum CodingKeys: String, CodingKey {
        case responseCode
        case responseDescription = "description"
        case result
    }
}

// MARK: - Result

public struct Result: Codable {
    public let items: [Item]?
}

// MARK: - Item

public struct Item: Codable {
    public let name: String?
    public let detail: Detail?
}

// MARK: - Detail

public struct Detail: Codable {
    public let email, phoneNumber: String?

    enum CodingKeys: String, CodingKey {
        case email
        case phoneNumber = "phone_number"
    }
}
