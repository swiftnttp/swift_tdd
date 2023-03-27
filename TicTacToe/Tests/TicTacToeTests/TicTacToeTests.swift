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
    var movesOLD: [String] = []
    var moves = [Move]()
    
    func applyMove() -> Board {
        return Board(currentPlayer: "O" ,movesOLD: movesOLD + [currentPlayer])
    }
}

final class TicTacToeTests: XCTestCase {
    func testPlayerXGoesFirst() {
        let board = Board()
            .applyMove()
        
        XCTAssertEqual(board.movesOLD, ["X"])
    }
    
    func testPlayerOGoesSecond() {
        let board = Board()
            .applyMove()
            .applyMove()
        
        XCTAssertEqual(board.movesOLD, ["X", "O"])
    }
}
