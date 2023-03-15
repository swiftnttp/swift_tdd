import XCTest
@testable import RomanNumerals

final class RomanNumeralsTests: XCTestCase {
    func testNumerals() throws {
        XCTAssertEqual(romanNumerals(1), "I")
        XCTAssertEqual(romanNumerals(2), "II")
        XCTAssertEqual(romanNumerals(3), "III")
        XCTAssertEqual(romanNumerals(4), "IV")
    }
    
    func romanNumerals(_ num: Int) -> String {
        if num <= 3, num > 1 {
            return "I" + romanNumerals(num - 1)
        }

        return "I"
    }
}
