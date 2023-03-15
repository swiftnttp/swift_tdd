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
        XCTAssertEqual(romanNumerals(9), "IX")
        XCTAssertEqual(romanNumerals(10), "X")
        XCTAssertEqual(romanNumerals(11), "XI")
        XCTAssertEqual(romanNumerals(12), "XII")
        XCTAssertEqual(romanNumerals(13), "XIII")
    }
    
    let dict = [1: "I", 4: "IV", 5: "V"]
    
    
    func romanNumerals(_ num: Int) -> String {
        if num <= 3, num > 1 {
            return dict[1]! + romanNumerals(num - 1)
        }
        if num > 5 && num <= 8 {
            return dict[5]! + romanNumerals(num - 5)
        }
        if num > 3 {
            if dict.keys.contains(num) {
                return dict[num]!
            }
        }
    
        return dict[1]!
    }
}
