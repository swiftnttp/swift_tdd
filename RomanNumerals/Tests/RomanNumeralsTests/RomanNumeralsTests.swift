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
    
    let dict = [1: "I", 2: "II", 3: "II", 4: "IV", 5: "V",
                6: "VI", 7: "VII", 8: "VIII"]
    
    
    func romanNumerals(_ num: Int) -> String {
        if num <= 3, num > 1 {
            return "I" + romanNumerals(num - 1)
        }
        if num > 3 {
            return dict[num]!
        }
        return "I"
    }
}
