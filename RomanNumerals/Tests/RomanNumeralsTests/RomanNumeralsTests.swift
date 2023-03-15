import XCTest
@testable import RomanNumerals

final class RomanNumeralsTests: XCTestCase {
    func testNumerals() throws {
        XCTAssertEqual(romanNumerals(1), "I")
        XCTAssertEqual(romanNumerals(2), "II")
        XCTAssertEqual(romanNumerals(3), "III")
        XCTAssertEqual(romanNumerals(4), "IV")
        XCTAssertEqual(romanNumerals(5), "V")
        XCTAssertEqual(romanNumerals(6), "VI")
        XCTAssertEqual(romanNumerals(7), "VII")
        XCTAssertEqual(romanNumerals(8), "VIII")
    }
    
    func romanNumerals(_ num: Int) -> String {
        if num <= 3, num > 1 {
            return "I" + romanNumerals(num - 1)
        }
        if num == 4 {
            return "IV"
        }
        if num == 5 {
            return "V"
        }

        return "I"
    }
}
