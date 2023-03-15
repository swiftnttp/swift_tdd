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
    
    let dict = [1: "I", 4: "IV", 5: "V", 9: "IX", 10: "X"]
    
    
    func romanNumerals(_ number: Int) -> String {
        var number = number
        var string = ""
        for key in dict.keys.sorted(by: >) {
            while number >= key {
                string += dict[key]!
                number -= key
            }
        }
        return string
    }
}
