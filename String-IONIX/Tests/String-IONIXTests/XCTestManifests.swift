import XCTest

#if !canImport(ObjectiveC)
    public func allTests() -> [XCTestCaseEntry] {
        [
            testCase(String_IONIXTests.allTests),
        ]
    }
#endif
