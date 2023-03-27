import XCTest
@testable import TicTacToe

//Tic-Tac-Toe rules:
//• X always goes first
//• Players alternate placing X's and O's on the board
//• Players cannot play on a played position
//• A player with three X's or O's in a row (horizontally, vertically, or diagonally) wins
//• If all nine squares are filled and neither player achieves three in a row, the game is a draw

struct Board {
    
    var moves: [String] = []
    
    func applyMove(_ player: String) -> Board {
        return Board(moves: [player])
    }
}

final class TicTacToeTests: XCTestCase {
    func testPlayerXGoesFirst() {
        let board = Board()
            .applyMove("X")
        
        XCTAssertEqual(board.moves, ["X"])
    }
    
    func testPlayerOGoesSecond() {
        let board = Board()
            .applyMove("X")
            .applyMove("O")
        
        XCTAssertEqual(board.moves, ["X", "O"])

    }
}
