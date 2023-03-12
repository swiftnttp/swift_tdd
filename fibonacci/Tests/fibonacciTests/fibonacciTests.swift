import XCTest
@testable import fibonacci

final class fibonacciTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(fibonacci().text, "Hello, World!")
    }
}
