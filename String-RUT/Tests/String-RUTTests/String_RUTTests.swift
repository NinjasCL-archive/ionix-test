@testable import String_RUT
import XCTest

final class String_RUTTests: XCTestCase {
    let rut = "1-9"

    func testThatRUTExtensionWorks() {
        let result = rut.rut
        XCTAssertEqual(result.formatted, rut)
        XCTAssertEqual(result.isValid, true)
    }

    static var allTests = [
        ("testThatRUTExtensionWorks", testThatRUTExtensionWorks),
    ]
}
