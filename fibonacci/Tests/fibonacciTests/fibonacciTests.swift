import XCTest
@testable import fibonacci

//0, 1, 2, 3, 4, 5, 6, 7,  8,  9
//0, 1, 1, 2, 3, 5, 8, 13, 21, 34

final class fibonacciTests: XCTestCase {
    func testFibonacci() throws {
        XCTAssertEqual(fibonacci(0), 0)
        XCTAssertEqual(fibonacci(1), 1)
        XCTAssertEqual(fibonacci(2), 1)
        XCTAssertEqual(fibonacci(3), 2)
    }
    
    func fibonacci(_ input: Int) -> Int {
        if input == 2 {
            return 1
        }
        if input == 1 {
            return 1
        }
        return 0
    }
}
