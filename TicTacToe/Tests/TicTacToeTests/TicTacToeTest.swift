//
//  TicTacToeTest.swift
//  
//
//  Created by Ihor Obrizko on 31.03.2023.
//

import XCTest

enum Event {
    case gameStarted
}

final class TicTacToeTest: XCTestCase {

    func testReceiveGameStartUponCreation() {
        XCTAssertEqual(process(), [.gameStarted])
    }
    
    func process() -> [Event] {
        [.gameStarted]
    }
}
