import XCTest

#if !canImport(ObjectiveC)
    public func allTests() -> [XCTestCaseEntry] {
        [
            testCase(Env_IONIXTests.allTests),
        ]
    }
#endif
