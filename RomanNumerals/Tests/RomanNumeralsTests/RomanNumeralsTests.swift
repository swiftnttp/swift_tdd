import XCTest
@testable import RomanNumerals

final class RomanNumeralsTests: XCTestCase {
    func testNumerals() throws {
       XCTAssertEqual(romanNumerals(1), "I")
    }
}
