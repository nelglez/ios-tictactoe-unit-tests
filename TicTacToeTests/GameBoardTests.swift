//
//  GameBoardTests.swift
//  TicTacToeTests
//
//  Created by Nelson Gonzalez on 2/27/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe //spaces use underscore: Tic_Tac_Toe

class GameBoardTests: XCTestCase {

    
    //Verbose testing names, so that we dont need comments describing test
     //Red Green Refactor
    
    //Control + Command + Up Arrow = toggle interface
    func testGameBoardIsEmptyOnStart() {
        //make a game board
        let board = GameBoard()
        
        for x in 0..<3 {
            for y in 0..<3 {
                //x, y coordinates
                XCTAssertNil(board[(x, y)])
                
                //XCTAssertNil(board[(x, y)] == nil) prefer method above
                
            }
        }
       
//        XCTFail()
    }
    
    func testPlacingSingleMark() {
        var board = GameBoard()
        
        XCTAssertNoThrow(try board.place(mark: .o, on: (0,0)))
        
        //Asser(expected, actual)
        XCTAssertEqual(.o, board[(0,0)])
    }
    
    func testPlacingSingleMarkWithThrows() throws {
        var board = GameBoard()
        
        try board.place(mark: .o, on: (1,2))
        
        //Asser(expected, actual)
        XCTAssertEqual(.o, board[(1,2)])
        
        //Testing as many edge cases that make you confident
        
        try board.place(mark: .x, on: (2,2))
        
        XCTAssertEqual(.x, board[(2,2)])
    }

    func testIsBoardIsFullAfterFillingAllSpots() throws {
        
        var board = GameBoard()
        
        //test not full as we fill it
        
        for x in 0..<3 {
            for y in 0..<3 {
                XCTAssertFalse(board.isFull)//expecting false
                //Fill it
                try board.place(mark: .x, on: (x, y))
            }
        }
        
        //test it is full after it is filled

        XCTAssertTrue(board.isFull)
 
    }

    func testPlacingDuplicateMarkThrowsAnError() throws {
        var board = GameBoard()
        
        //place a tile 2 times in same spot
       
        try board.place(mark: .o, on: (1,1))
        
        XCTAssertThrowsError(try board.place(mark: .o, on: (1,1))) { (error) in
            XCTAssertEqual(error as? GameBoardError, .invalidSquare)
        }
        
        
    }
    
    
}
