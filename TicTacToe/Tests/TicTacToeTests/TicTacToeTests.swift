import XCTest
@testable import TicTacToe

//Tic-Tac-Toe rules:
//• X always goes first
//• Players alternate placing X's and O's on the board
//• Players cannot play on a played position
//• A player with three X's or O's in a row (horizontally, vertically, or diagonally) wins
//• If all nine squares are filled and neither player achieves three in a row, the game is a draw

enum BoardError: Error {
    case positionIsPlayed
    case positionIsOutOfTheBoard
}

struct Move {
    let playerString: String
    var player: Player {
        playerString == "X" ? .X : .O
    }
    let position: Position
}

struct Board {
    var currentPlayerStr = "X"
    var currentPlayer: Player = .X
    var moves = [Move]()
    
    func applyMove(_ position: Position) -> Result<Board, BoardError> {
        guard !checkIfPlayedPosition(position) else {
            return .failure(.positionIsPlayed)
        }
        var board = self
        board.moves.append(Move(playerString: currentPlayerStr, position: position))
        board.currentPlayerStr = nextPlayer()
        board.currentPlayer = currentPlayer == .X ? .O : .X
        return .success(board)
    }
    
    private func checkIfPlayedPosition(_ position: Position) -> Bool {
        moves.contains { $0.position == position }
    }
    
    private func nextPlayer() -> String {
        currentPlayerStr == "X" ? "O" : "X"
    }
}

final class TicTacToeTests: XCTestCase {
    func testPlayerXGoesFirst() {
        let board = Board()
            .applyMoveUnsafe(Position(x: 0, y: 0))
        
        XCTAssertEqual(board.moves.last?.player, .X)
    }
    
    func testPlayerOGoesSecond() {
        let board = Board()
            .applyMoveUnsafe(Position(x: 0, y: 0))
            .applyMoveUnsafe(Position(x: 1, y: 1))
        
        XCTAssertEqual(board.moves.last?.player, .O)
    }
    
    func testPlayerXGoesThird() {
        let board = Board()
            .applyMoveUnsafe(Position(x: 0, y: 0))
            .applyMoveUnsafe(Position(x: 1, y: 1))
            .applyMoveUnsafe(Position(x: 2, y: 2))
        
        XCTAssertEqual(board.moves.last?.player, .X)
    }
    
    func testPlayerCannotPlayOnPlayedPosition() {
        let board = Board()
            .applyMoveUnsafe(Position(x: 0, y: 0))
        
        let result = board.applyMove(Position(x: 0, y: 0))
        
        XCTAssertThrowsError(try result.get()) { error in
            XCTAssertEqual(error as? BoardError, .positionIsPlayed)
        }
    }
}

private extension Board {
    func applyMoveUnsafe(_ position: Position) -> Board {
        try! applyMove(position).get()
    }
}
