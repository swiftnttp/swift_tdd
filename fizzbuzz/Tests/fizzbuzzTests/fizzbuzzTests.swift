import XCTest
@testable import fizzbuzz

final class fizzbuzzTests: XCTestCase {
    func testOne() throws {
        XCTAssertEqual(fizzbuzz(1), "1")
    }
    
    func testTwo() throws {
        XCTAssertEqual(fizzbuzz(2), "2")
    }
    
    func fizzbuzz(_ int: Int) -> String {
        if int == 2 {
            return "2"
        }
        return "1"
    }
    
    
}
