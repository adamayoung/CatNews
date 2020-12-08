import XCTest
@testable import CatNewsCore

final class CatNewsCoreTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(CatNewsCore().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
