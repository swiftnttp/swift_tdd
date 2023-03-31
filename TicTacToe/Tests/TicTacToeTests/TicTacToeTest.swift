//
//  TicTacToeTest.swift
//  
//
//  Created by Ihor Obrizko on 31.03.2023.
//

import XCTest
/*
 Game started
 Updated board
 Failed
 */
enum Event: Equatable {
    
    case gameStarted
    case boardUpdated(Board)
}

final class TicTacToeTest: XCTestCase {

    func testReceiveGameStartUponCreation() {
        XCTAssertEqual(process(), [.gameStarted])
    }
    
    func testReceiveUpdatedBoardUponMove() {
        XCTAssertEqual(process([0, 0]), [.boardUpdated])
    }
    
    func process(_ input: [Int] = []) -> [Event] {
        [.gameStarted]
    }
}
