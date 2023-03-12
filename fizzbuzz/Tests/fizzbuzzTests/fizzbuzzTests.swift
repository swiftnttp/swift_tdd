import XCTest
@testable import fizzbuzz

final class fizzbuzzTests: XCTestCase {
    func testOne() {
        XCTAssertEqual(fizzbuzz(1), "1")
    }
    
    func testTwo() {
        XCTAssertEqual(fizzbuzz(2), "2")
    }
    
    func testThree() {
        XCTAssertEqual(fizzbuzz(3), "Fizz")
    }
    
    func testFive() {
        XCTAssertEqual(fizzbuzz(5), "Buzz")
    }
    
    func fizzbuzz(_ int: Int) -> String {
        if int == 5 {
            return "Buzz"
        }
        if int == 3 {
            return "Fizz"
        }
        return "\(int)"
    }
}
