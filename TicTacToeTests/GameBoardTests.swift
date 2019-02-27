//
//  GameBoardTests.swift
//  TicTacToeTests
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameBoardTests: XCTestCase {
    
    var board: GameBoard!
    
    override func setUp() {
        //runs every time for every test in this file
        //  print("setUp()")
        board = GameBoard()
    }
    
    func testCreatingEmptyBoard() {
       

        for x in 0..<3 {
            for y in 0..<3 {
                XCTAssertNil(board[(x, y)])
            }
        }
    }
    
    func testPlacingSingleMark() {
      
        
        XCTAssertNoThrow(try board.place(mark: .o, on: (0,0)))
        
        //Asser(expected, actual)
        XCTAssertEqual(.o, board[(0,0)])
    }
    
//    func testPlacingMarks() {
//        var board = GameBoard()
//        XCTAssertNoThrow(try board.place(mark: .o, on: (0, 0)))
//        XCTAssertEqual(board[(0, 0)], .o)
//        XCTAssertNoThrow(try board.place(mark: .x, on: (2, 2)))
//        XCTAssertEqual(board[(2, 2)], .x)
//        for x in 0..<3 {
//            for y in 0..<3 {
//                if x == 0 && y == 0 { continue }
//                if x == 2 && y == 2 { continue }
//                XCTAssertNil(board[(x, y)])
//            }
//        }
//
//        // Make sure you can't change an already marked square
//        XCTAssertThrowsError(try board.place(mark: .x, on: (0, 0))) { (error) in
//            XCTAssertEqual(error as? GameBoardError, GameBoardError.invalidSquare)
//        }
//    }
//
//    func testIsFull() {
//        var board = GameBoard()
//
//        try! board.place(mark: .x, on: (0, 0))
//        try! board.place(mark: .o, on: (0, 1))
//        try! board.place(mark: .x, on: (1, 0))
//        try! board.place(mark: .o, on: (2, 0))
//        try! board.place(mark: .x, on: (0, 2))
//        try! board.place(mark: .o, on: (1, 1))
//        try! board.place(mark: .x, on: (2, 1))
//        try! board.place(mark: .o, on: (1, 2))
//        XCTAssertFalse(board.isFull)
//
//        try! board.place(mark: .x, on: (2, 2))
//        XCTAssertTrue(board.isFull)
//    }
    
    func testPlacingSingleMarkWithThrows() throws {
      
        
        try board.place(mark: .o, on: (1,2))
        
        //Asser(expected, actual)
        XCTAssertEqual(.o, board[(1,2)])
        
        //Testing as many edge cases that make you confident
        
        try board.place(mark: .x, on: (2,2))
        
        XCTAssertEqual(.x, board[(2,2)])
    }
    
    func testIsBoardIsFullAfterFillingAllSpots() throws {
        
       
        
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
       
        
        //place a tile 2 times in same spot
        
        try board.place(mark: .o, on: (1,1))
        
        XCTAssertThrowsError(try board.place(mark: .o, on: (1,1))) { (error) in
            XCTAssertEqual(error as? GameBoardError, .invalidSquare)
        }
        
        
    }

}
