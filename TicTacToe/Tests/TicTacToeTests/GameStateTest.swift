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
    
    func gameState(_ board: Board) -> GameState {
        return .gameInProgress
    }
}

private extension Board {
    func applyMoveUnsafe(_ position: Position) -> Board {
        try! applyMove(position).get()
    }
}
