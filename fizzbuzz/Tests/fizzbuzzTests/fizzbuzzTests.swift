import XCTest
@testable import fizzbuzz

final class fizzbuzzTests: XCTestCase {
    func testNumbers() {
        XCTAssertEqual(fizzbuzz(1), "1")
        XCTAssertEqual(fizzbuzz(2), "2")
    }
    
    func testFizz() {
        XCTAssertEqual(fizzbuzz(3), "Fizz")
        XCTAssertEqual(fizzbuzz(6), "Fizz")
    }
    
    func testBuzz() {
        XCTAssertEqual(fizzbuzz(5), "Buzz")
        XCTAssertEqual(fizzbuzz(10), "Buzz")
    }
    
    func testFizzBuzz() {
        XCTAssertEqual(fizzbuzz(15), "FizzBuzz")
        XCTAssertEqual(fizzbuzz(30), "FizzBuzz")
    }
    
    func fizzbuzz(_ int: Int) -> String {
        if int % 5 == 0 && int % 3 == 0 {
            return "FizzBuzz"
        }
        if int % 5 == 0 {
            return "Buzz"
        }
        if int % 3 == 0 {
            return "Fizz"
        }
        return "\(int)"
    }
}
