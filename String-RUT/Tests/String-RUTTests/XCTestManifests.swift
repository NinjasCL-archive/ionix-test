import XCTest

#if !canImport(ObjectiveC)
    public func allTests() -> [XCTestCaseEntry] {
        [
            testCase(String_RUTTests.allTests),
        ]
    }
#endif
