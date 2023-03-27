import XCTest
@testable import TicTacToe

//Tic-Tac-Toe rules:
//• X always goes first
//• Players alternate placing X's and O's on the board
//• Players cannot play on a played position
//• A player with three X's or O's in a row (horizontally, vertically, or diagonally) wins
//• If all nine squares are filled and neither player achieves three in a row, the game is a draw

struct Position {
    let x: Int
    let y: Int
}

struct Move {
    let player: String
    let position: Position
}

struct Board {
    var currentPlayer = "X"
    var moves = [Move]()
    
    func applyMove(_ position: Position) -> Board {
        return Board(
            currentPlayer: "O",
            moves: moves + [Move(player: currentPlayer, position: position)])
    }
}

final class TicTacToeTests: XCTestCase {
    func testPlayerXGoesFirst() {
        let board = Board()
            .applyMove(Position(x: 0, y: 0))
        
        XCTAssertEqual(board.moves.last?.player, "X")
    }
    
    func testPlayerOGoesSecond() {
        let board = Board()
            .applyMove(Position(x: 0, y: 0))
            .applyMove(Position(x: 1, y: 1))
        
        XCTAssertEqual(board.moves.last?.player, "O")
    }
    
    func testPlayerXGoesThird() {
        let board = Board()
            .applyMove(Position(x: 0, y: 0))
            .applyMove(Position(x: 1, y: 1))
            .applyMove(Position(x: 2, y: 2))
        
        XCTAssertEqual(board.moves.last?.player, "X")
    }
}
