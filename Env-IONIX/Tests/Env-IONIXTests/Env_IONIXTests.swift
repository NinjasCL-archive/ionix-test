@testable import Env_IONIX
import XCTest

final class Env_IONIXTests: XCTestCase {
    func testThatDevEnvironmentWorks() {
        let dev = Environment.dev
        XCTAssertEqual(dev.id, "dev")
    }

    static var allTests = [
        ("testThatDevEnvironmentWorks", testThatDevEnvironmentWorks),
    ]
}
