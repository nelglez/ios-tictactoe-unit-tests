//
//  GameAITests.swift
//  TicTacToeTests
//
//  Created by Nelson Gonzalez on 2/27/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameAITests: XCTestCase {
  
    //Test driven development = TDD
    //Red, Green, Refactor

    //Win 8 possible solutions
    //16 wins
    //DRY: Dont repeat yourself
    
    var board: GameBoard!
    
    override func setUp() {
        //runs every time for every test in this file
      //  print("setUp()")
        board = GameBoard()
    }
    
    func testWinCheckingVertical1stColumn() {
       
        /*
         x 0 -
         x 0 -
         x - -
         */
        try! board.place(mark: .x, on: (0,0))
        try! board.place(mark: .o, on: (1,0))
        try! board.place(mark: .x, on: (0,1))
        try! board.place(mark: .o, on: (1,1))
        try! board.place(mark: .x, on: (0,2))
        
        
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
        
    }
    
    func testWinCheckingVertical2ndColumn() {
        /*
         x o -
         x o -
         - o -
         */
       
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .o, on: (1, 2))
        
        XCTAssertTrue(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }
    
    
}
