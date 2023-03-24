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

protocol Node {
    func evaluate() -> Bool
}

class Operand: Node {
    let value: Bool
    init(value: Bool) {
        self.value = value
    }
    
    func evaluate() -> Bool {
        value
    }
}

class Operator: Node {
    init(left: Node, right: Node) {
        self.left = left
        self.right = right
    }
    
    var left: Node
    var right: Node
    
    
    func evaluate() -> Bool {
        left.evaluate() && right.evaluate()
    }
}

final class BooleanCalculatorTests: XCTestCase {
    func testSingleValue() {
        XCTAssertEqual(calculate("TRUE"), true)
        XCTAssertEqual(calculate("FALSE"), false)
    }
    
    func testAnd() {
        XCTAssertEqual(calculate("TRUE AND TRUE"), true)
        XCTAssertEqual(calculate("TRUE AND FALSE"), false)
        XCTAssertEqual(calculate("FALSE AND TRUE"), false)
        XCTAssertEqual(calculate("FALSE AND FALSE"), false)
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
        
        var node: Node?
        print(tokens)
        var i = 0
        while i < tokens.count {
            let token = tokens[i]
            
            switch token {
            case .bool(let value):
                node = Operand(value: value)
            case .and:
                i += 1
                if case let .bool(val) = tokens[i] {
                    let op = Operator(left: node!, right: Operand(value: val))
                    node = op
                }
            }
            
            i += 1
        }
        
        return node?.evaluate()
    }
}
