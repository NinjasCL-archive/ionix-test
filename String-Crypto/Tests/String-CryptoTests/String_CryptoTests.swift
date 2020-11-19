@testable import String_Crypto
import XCTest

final class String_CryptoTests: XCTestCase {
    let plain = "hello"
    let key = "world"
    let encrypted = "zVMLcCqfcoM="
    let hex = "68656c6c6f"

    func testThatDESEncryptWorks() throws {
        let result = try plain.encryptDES(key: key)
        XCTAssertEqual(result, encrypted)
    }

    func testThatDESDecryptWorks() throws {
        let result = try encrypted.decryptDES(key: key)
        XCTAssertEqual(result, plain)
    }

    func testThatHexDescriptionWorks() throws {
        let result = plain.hexDescription
        XCTAssertEqual(result, hex)
    }

    static var allTests = [
        ("testThatDESEncryptWorks", testThatDESEncryptWorks),
        ("testThatDESDecryptWorks", testThatDESDecryptWorks),
        ("testThatHexDescriptionWorks", testThatHexDescriptionWorks),
    ]
}
