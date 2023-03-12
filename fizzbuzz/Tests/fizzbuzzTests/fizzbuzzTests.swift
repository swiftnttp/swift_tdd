import XCTest
@testable import fizzbuzz

final class fizzbuzzTests: XCTestCase {
    func testOne() throws {
        XCTAssertEqual(fizzbuzz(1), "1")
    }
    
    func fizzbuzz(_ int: Int) -> String {
        return "1"
    }
    
    
}
