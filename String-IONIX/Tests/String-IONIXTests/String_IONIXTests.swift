@testable import String_IONIX
import XCTest

final class String_IONIXTests: XCTestCase {
    let rut = "1-9"
    let encoded = "FyaSTkGi8So="

    func testThatStringEncodingWorks() {
        let result = rut.encodeForRUTRequest()

        XCTAssertEqual(result, encoded)
    }

    static var allTests = [
        ("testThatStringEncodingWorks", testThatStringEncodingWorks),
    ]
}
