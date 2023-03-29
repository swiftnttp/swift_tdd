//
//  PositionTest.swift
//  
//
//  Created by Ihor Obrizko on 29.03.2023.
//

import XCTest


struct Position: Equatable {
    let x: Int
    let y: Int
    
    static func make(_ x: Int, _ y: Int) -> Result<Position, BoardError> {
        if x < 0 || y < 0 || x > 3 || y > 3 {
            return .failure(.positionIsOutOfTheBoard)
        } else {
            return .success(Position(x: x, y: y))
        }
    }
}

final class PositionTest: XCTestCase {
    func testPositionCannotExceedUpperBoundary() {
        let result = Position.make(4, 4)
        
        XCTAssertThrowsError(try result.get()) { error in
            XCTAssertEqual(error as? BoardError, .positionIsOutOfTheBoard)
        }
    }
    
    func testPositionCannotExceedLowerBoundary() {
        let result = Position.make(-1, -1)
        
        XCTAssertThrowsError(try result.get()) { error in
            XCTAssertEqual(error as? BoardError, .positionIsOutOfTheBoard)
        }
    }
}
