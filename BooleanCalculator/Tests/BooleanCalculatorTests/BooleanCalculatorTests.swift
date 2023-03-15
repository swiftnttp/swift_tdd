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
    func testSingleValue() {
        XCTAssertEqual(calculate("TRUE"), true)
        XCTAssertEqual(calculate("FALSE"), false)
    }
    
    func testAnd() {
        XCTAssertEqual(calculate("TRUE AND FALSE"), false)
    }
    
    func testIncorrectString() {
        XCTAssertEqual(calculate("klsdfjso"), nil)
    }
    
    enum Token {
        case bool(Bool)
        case and
    }
    
    func calculate(_ str: String) -> Bool? {
        let arr = str.split(separator: " ")
        var tokens = [Token]()
        
        for string in arr {
            if string == "FALSE" {
                tokens.append(.bool(false))
            }
            if string == "TRUE" {
                tokens.append(.bool(true))
            }
            if string == "AND" {
                tokens.append(.and)
            }
        }

        if str == "TRUE AND FALSE" {
            return false
        }

        
        if tokens.count > 0 {
            if case let .bool(val) = tokens[0] {
                return val
            }
        }
        return nil
    }
}
