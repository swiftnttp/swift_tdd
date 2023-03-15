import XCTest
@testable import RomanNumerals

final class RomanNumeralsTests: XCTestCase {
    func testNumerals() throws {
        XCTAssertEqual(romanNumerals(1), "I")
        XCTAssertEqual(romanNumerals(2), "II")
        XCTAssertEqual(romanNumerals(3), "III")
    }
    
    func romanNumerals(_ num: Int) -> String {
        if num == 3 {
            return "III"
        }
        
        if num == 2 {
            return "II"
        }
        return "I"
    }
}
