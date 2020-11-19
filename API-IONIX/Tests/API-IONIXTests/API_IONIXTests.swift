import Combine
import Env_IONIX
import XCTest

@testable import API_IONIX

@available(iOS 13.0, *)
var users = Set<AnyCancellable>()

@available(iOS 13.0, *)
var menuItems = Set<AnyCancellable>()

@available(iOS 13.0, *)
final class API_IONIXTests: XCTestCase {
    let rut = "1-9"
    let timeout: TimeInterval = 10

    override func setUp() {
        Environment.boot(.testing)
    }

    func testThatAPISearchWorks() {
        let expectation = XCTestExpectation(description: "Search Users")

        _ = API.search.users(for: rut)
            .sink(receiveCompletion: { completion in
                print("Finished:\(String(describing: completion))")
                expectation.fulfill()
            }, receiveValue: { response in
                let items = response.result?.items!
                XCTAssertTrue((items?.count)! > 2)
                XCTAssertEqual(items?.first?.name, "John")
            }).store(in: &users)

        wait(for: [expectation], timeout: timeout)
    }

    func testthatAPIMenuItemsWorks() {
        let expectation = XCTestExpectation(description: "Get Menu Items")

        _ = API.menu.items().sink(receiveCompletion: { _ in
            expectation.fulfill()
        }, receiveValue: { items in
            XCTAssertTrue(items.count == 6)
            XCTAssertEqual(items.first?.sort, 0)
        }).store(in: &menuItems)

        wait(for: [expectation], timeout: timeout)
    }

    static var allTests = [
        ("testThatAPISearchWorks", testThatAPISearchWorks),
        ("testthatAPIMenuItemsWorks", testthatAPIMenuItemsWorks),
    ]
}
