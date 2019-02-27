//
//  GameAI.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
//If someone has won
func game(board: GameBoard, isWonBy player: GameBoard.Mark) -> Bool {
    
    //(0,0), (0,1), (0,2)
    
   // let positions = [(0,0), (0,1), (0,2)]
    //loop through looking for solution
    
  //  let x = 0
    //Test vertical Win Conditions
    for x in 0..<3 {
        var numMarks = 0
        
        for y in 0..<3 {
            let position = (x, y)
            if board[position] == player {
                //3 in a row
                numMarks += 1
            }
        }
        
        // How do we know if there's a win?
        
        if numMarks == 3 {
            return true
        }
        
    }
    
    //Test Horizontal Win conditions
    //(0,0), (1,0), (2,0)
    if board[(0,0)] == player && board[(1,0)] == player &&
        board[(2,0)] == player {
        //Do something
    }
    //(0,1), (1,1), (2,1)
    //(0,02), (1,2), (2,2)
    
    
    //Test Diagonal win conditions
    //(0,0), (1,1), (2,2)
    //(2,0), (1,1), (0,2)
    
    return false
}
