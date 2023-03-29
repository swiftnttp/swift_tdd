//
//  GameStateTest.swift
//  
//
//  Created by Ihor Obrizko on 29.03.2023.
//

import XCTest

enum Player {
    case X, Y
}

enum GameState: Equatable {
    case gameInProgress
    case userWon(Player)
}

final class GameStateTest: XCTestCase {

    func testFoo() {
        let board = Board()
        
        let state = gameState(board)
        
        XCTAssertEqual(state, .gameInProgress)
    }
    
    func testXWonVertically() {
        let board = Board()
            .applyMoveUnsafe(Position(x: 0, y: 0))
            .applyMoveUnsafe(Position(x: 2, y: 0))
            .applyMoveUnsafe(Position(x: 0, y: 1))
            .applyMoveUnsafe(Position(x: 2, y: 1))
            .applyMoveUnsafe(Position(x: 0, y: 2))
        
        
        let state = gameState(board)
        
        XCTAssertEqual(state, .userWon(.X))
    }
    
    func testXWonHorizontally() {
        let board = Board()
            .applyMoveUnsafe(Position(x: 0, y: 0))
            .applyMoveUnsafe(Position(x: 0, y: 2))
            .applyMoveUnsafe(Position(x: 1, y: 0))
            .applyMoveUnsafe(Position(x: 0, y: 1))
            .applyMoveUnsafe(Position(x: 2, y: 0))
        
        
        let state = gameState(board)
        
        XCTAssertEqual(state, .userWon(.X))
    }
    
    func gameState(_ board: Board) -> GameState {
        for i in 0...2 {
            let column = board.moves.filter { $0.position.x == i }
            
            if column.count == 3 {
                if column[0].player == column[1].player && column[1].player == column[2].player {
                    return .userWon(column[0].player == "X" ? .X : .Y)
                }
            }
        }
        
        let firstRow = board.moves.filter { $0.position.y == 0 }
        if firstRow.allSatisfy({ $0.player == "X"}) && firstRow.count == 3 {
            return .userWon(.X)
        }

        return .gameInProgress
    }
}

private extension Board {
    func applyMoveUnsafe(_ position: Position) -> Board {
        try! applyMove(position).get()
    }
}
