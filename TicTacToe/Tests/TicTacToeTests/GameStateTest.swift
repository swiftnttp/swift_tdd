//
//  GameStateTest.swift
//  
//
//  Created by Ihor Obrizko on 29.03.2023.
//

import XCTest

enum Player {
    case X, O
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
    
    func testXWonDiagonally() {
        let board = Board()
            .applyMoveUnsafe(Position(x: 0, y: 0))
            .applyMoveUnsafe(Position(x: 0, y: 2))
            .applyMoveUnsafe(Position(x: 1, y: 1))
            .applyMoveUnsafe(Position(x: 0, y: 1))
            .applyMoveUnsafe(Position(x: 2, y: 2))
        
        
        let state = gameState(board)
        
        XCTAssertEqual(state, .userWon(.X))
    }
    
    func testYWonDiagonally() {
        let board = Board()
            .applyMoveUnsafe(Position(x: 0, y: 0))
            .applyMoveUnsafe(Position(x: 0, y: 3))
            .applyMoveUnsafe(Position(x: 3, y: 3))
            .applyMoveUnsafe(Position(x: 1, y: 1))
            .applyMoveUnsafe(Position(x: 3, y: 2))
            .applyMoveUnsafe(Position(x: 3, y: 0))
        
        
        let state = gameState(board)
        
        XCTAssertEqual(state, .userWon(.X))
    }
    
    func gameState(_ board: Board) -> GameState {
        for i in 0...2 {
            let column = board.moves.filter { $0.position.x == i }
            
            if column.count == 3 {
                if column[0].player == column[1].player && column[1].player == column[2].player {
                    return .userWon(column[0].player)
                }
            }
        }
        
        for i in 0...2 {
            let row = board.moves.filter { $0.position.y == i }
            
            if row.count == 3 {
                if row[0].player == row[1].player && row[1].player == row[2].player {
                    return .userWon(row[0].player)
                }
            }
        }
        
        if board.moves.contains(where: { $0.position.y == 0 && $0.position.x == 0 }) &&
            board.moves.contains(where: { $0.position.y == 1 && $0.position.x == 1 }) &&
            board.moves.contains(where: { $0.position.y == 2 && $0.position.x == 2 }) {
            let player = board.moves.first(where: { $0.position.y == 0 && $0.position.x == 0 })!.player
            return .userWon(player)
        }
        
        if board.moves.contains(where: { $0.position.y == 0 && $0.position.x == 3 }) &&
            board.moves.contains(where: { $0.position.y == 1 && $0.position.x == 1 }) &&
            board.moves.contains(where: { $0.position.y == 3 && $0.position.x == 0 }) {
            let player = board.moves.first(where: { $0.position.y == 0 && $0.position.x == 0 })!.player
            return .userWon(player)
        }

        return .gameInProgress
    }
}

private extension Board {
    func applyMoveUnsafe(_ position: Position) -> Board {
        try! applyMove(position).get()
    }
}
