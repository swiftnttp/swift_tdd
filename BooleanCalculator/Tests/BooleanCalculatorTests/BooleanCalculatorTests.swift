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

class And: Node {
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

class Or: Node {
    init(left: Node, right: Node) {
        self.left = left
        self.right = right
    }
    
    var left: Node
    var right: Node
    
    
    func evaluate() -> Bool {
        left.evaluate() || right.evaluate()
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
    
    func testOR() {
        XCTAssertEqual(calculate("TRUE OR TRUE"), true)
        XCTAssertEqual(calculate("TRUE OR FALSE"), true)
        XCTAssertEqual(calculate("FALSE OR TRUE"), true)
        XCTAssertEqual(calculate("FALSE OR FALSE"), false)
    }
    
    func testLong() {
        XCTAssertEqual(calculate("TRUE OR FALSE AND TRUE"), true)
        XCTAssertEqual(calculate("TRUE OR FALSE OR FALSE"), true)
        XCTAssertEqual(calculate("TRUE AND FALSE OR FALSE"), false)
        XCTAssertEqual(calculate("TRUE AND FALSE OR TRUE"), true)
    }
    
    func testIncorrectString() {
        XCTAssertEqual(calculate("klsdfjso"), nil)
    }
    
    enum Token {
        case bool(Bool)
        case and
        case or
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
            if string == "OR" {
                tokens.append(.or)
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
                    let op = And(left: node!, right: Operand(value: val))
                    node = op
                }
            case .or:
                i += 1
                if case let .bool(val) = tokens[i] {
                    let op = Or(left: node!, right: Operand(value: val))
                    node = op
                }
            }
            
            i += 1
        }
        
        return node?.evaluate()
    }
}
