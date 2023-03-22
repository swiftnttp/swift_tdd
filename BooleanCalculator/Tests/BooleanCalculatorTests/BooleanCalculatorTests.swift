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

        if tokens.count == 3 {
            var temp1: Bool?
            var temp2: Bool?
            if case let .bool(val) = tokens[0] {
                temp1 = val
            }
            if case let .bool(val) = tokens[2] {
                temp2 = val
            }
            guard let temp1 = temp1, let temp2 = temp2 else { return nil }
            return temp1 && temp2
        }
        
        if tokens.count > 0 {
            if case let .bool(val) = tokens[0] {
                return val
            }
        }
        return nil
    }
}
