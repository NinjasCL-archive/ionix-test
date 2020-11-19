import XCTest

#if !canImport(ObjectiveC)
    public func allTests() -> [XCTestCaseEntry] {
        [
            testCase(String_CryptoTests.allTests),
        ]
    }
#endif
