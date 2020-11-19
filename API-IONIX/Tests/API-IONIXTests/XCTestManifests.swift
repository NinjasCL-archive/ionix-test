import XCTest

#if !canImport(ObjectiveC)
    public func allTests() -> [XCTestCaseEntry] {
        [
            testCase(API_IONIXTests.allTests),
        ]
    }
#endif
