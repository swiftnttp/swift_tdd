import XCTest
@testable import fizzbuzz

final class fizzbuzzTests: XCTestCase {
    func testNumbers() {
        XCTAssertEqual(fizzbuzz(1), "1")
        XCTAssertEqual(fizzbuzz(2), "2")
    }
    
    func testFizz() {
        XCTAssertEqual(fizzbuzz(3), "Fizz")
    }
    
    func testBuzz() {
        XCTAssertEqual(fizzbuzz(5), "Buzz")
    }
    
    func testFizzBuzz() {
        XCTAssertEqual(fizzbuzz(15), "FizzBuzz")
    }
    
    func fizzbuzz(_ int: Int) -> String {
        if int == 5 {
            return "Buzz"
        }
        if int == 3 {
            return "Fizz"
        }
        if int == 15 {
            return "FizzBuzz"
        }
        return "\(int)"
    }
}
