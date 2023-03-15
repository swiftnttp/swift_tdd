import XCTest
@testable import BooleanCalculator

//Supports single values:
//  "TRUE" -> true
//  "FALSE" -> false
//Supports the NOT operator:
//   "NOT TRUE" -> false
//Supports the AND operator:
//   "TRUE AND FALSE" -> false
//   "TRUE AND TRUE" -> true
//Supports the OR operator:
//   "TRUE OR FALSE" -> true
//    "FALSE OR FALSE" -> false

final class BooleanCalculatorTests: XCTestCase {
    func testExample() {
        XCTAssertEqual(calculate("TRUE"), true)
    }
}
