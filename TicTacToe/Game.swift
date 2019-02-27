//
//  Game.swift
//  TicTacToe
//
//  Created by Nelson Gonzalez on 2/27/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
struct Game {
    
    private(set) var board: GameBoard
    
    internal var activePlayer: GameBoard.Mark?
    internal var gameIsOver: Bool
    internal var winningPlayer: GameBoard.Mark?
    
    
    
    mutating internal func restart(){
        board = GameBoard()
        activePlayer = .x
        gameIsOver = false
    }
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        guard let player = activePlayer else {
             NSLog("Game is over")
            return
        }
        
        do {
            try board.place(mark: player, on: coordinate)
            if game(board: board, isWonBy: player) {
               
                gameOver()
                winningPlayer = player
                
            } else {
                let newPlayer = player == .x ? GameBoard.Mark.o : GameBoard.Mark.x
                activePlayer = newPlayer
            }
        } catch {
            NSLog("Illegal move")
        }
    }
    
    mutating func gameOver() {
        //Active player nil if the game is over.
        activePlayer = nil
        gameIsOver = true
    }
    
}
