import XCTest
@testable import fibonacci

//0, 1, 2, 3, 4, 5, 6, 7,  8,  9
//0, 1, 1, 2, 3, 5, 8, 13, 21, 34

final class fibonacciTests: XCTestCase {
    func testFibonacci() throws {
        XCTAssertEqual(fibonacci(0), 0)
    }
}
