//
//  Model.swift
//  assign3
//
//  Created by Shahryar shagoshtasbi on 4/6/21.
//

import Foundation


enum Direction{
    case left
    case right
    case down
    case up
}


public class Triples: ObservableObject{
    
    
    
    @Published var board: [[Tile]]
    @Published var score: Int
    @Published var gameOver: Bool = false
    @Published var noMoreZeros: Bool = false
    var seed : SeededGenerator
    
    init(){
        self.score = 0
        self.gameOver = false
        //        self.board = [[Tile]](repeating: [Tile](repeating: Tile(val: 0, row: 0, col: 0), count: 4), count: 4)
        self.board = []
        self.seed = SeededGenerator(seed:14)
        
    }
    
    init(triplesGame: Triples) {
        self.score = triplesGame.score
        self.gameOver = triplesGame.gameOver
        self.board = triplesGame.board
        self.seed = triplesGame.seed
        
    }

    // re-inits 'board', and any other state you define
    func newgame(rand: Bool) {
        //        board = [[Tile]](repeating: [Tile](repeating: Tile(val: 0, row: 0, col: 0), count: 4), count: 4)
        board = []
        
        for i in 0..<4{
            var temp: [Tile] = []
            for j in 0..<4{
                temp.append(Tile(val: 0, row: i, col: j))
            }
            board.append(temp)
        }
        
        score = 0
        
        
        if rand { // It's in Random Mode
            seed = SeededGenerator(seed: UInt64(Int.random(in:1...1000)))
            //            print("It's in Random Mode")
            
        }else{ // It's in Deterministic Mode
            seed = SeededGenerator(seed:14)
            //            print("It's in Deterministic Mode")
        }
        spawn()
        spawn()
        spawn()
        spawn()
        
    }
    
    // This Function Randomly picks an available tile and puts a random value into it.
    func spawn(){
        
        // count the zeros
        var zerosCount:Int = 0
        var zeroTracker: [ Int: (Int, Int)] = [0:(0,0)] // A dictionary to keep track of the Zeros in the board [count: index]
        let newRandomValue = Int.random(in: 1...2, using: &seed) // To Randomly Decide Between the Values of 1 & 2
        
        // loop through the board
        for (i,row) in board.enumerated()
        {
            for (j, _) in row.enumerated()
            {
                if board[i][j].val == 0 {
                    zerosCount += 1
                    zeroTracker[zerosCount] = (i,j)
                }
            }
        }
        
        
        if (zerosCount != 0){
            
            score+=newRandomValue
            // To Randomly Decide for the Location to put the new value
            let randomIndex = Int.random(in: 1...zerosCount, using: &seed)
            
            // Setting new Random Value to the Randomly selected Index
            if let selectedIndex = zeroTracker[randomIndex]{
                board [selectedIndex.0][selectedIndex.1].val = newRandomValue
            }
            else{
                print("oopsi, something went wrong !!")
            }
        }
        else{
            noMoreZeros = true
        }
    }
    
    func isGameOver(triplesGame: Triples) -> Bool {
        let r = !triplesGame.endGameCollapser(dir: .right)
        let l = !triplesGame.endGameCollapser(dir: .left)
        let up = !triplesGame.endGameCollapser(dir: .up)
        let down = !triplesGame.endGameCollapser(dir: .down)
        
        if (noMoreZeros && r && l && down && up){
            return true
        }
        return false
    }
    
    
    func endGameCollapser (dir: Direction) -> Bool{
        var gameEnded = false
        
        switch dir {
        case Direction.left:
            gameEnded = shift()
        case Direction.right:
            rotate()
            rotate()
            gameEnded =  shift()
            rotate()
            rotate()
        case Direction.up:
            rotate()
            rotate()
            rotate()
            gameEnded = shift()
            rotate()
        case Direction.down:
            rotate()
            gameEnded =  shift()
            rotate()
            rotate()
            rotate()
        }
        
        return gameEnded
    }

    
    
//     collapse to the left
        func shift() -> Bool{
            var successShift = false
            for (i,row) in board.enumerated()
            {
                for (j, _) in row.enumerated()
                {
                    if j < 3 {
                        if board[i][j].val == 0 {
                            board[i][j + 1].val += board[i][j].val
                            board[i][j] = board[i][j+1]
                            successShift = true
                        }else if board[i][j].val  < 3{
                            if board[i][j].val == 1 && board[i][j + 1].val == 2 || board[i][j + 1].val == 0{
                                board[i][j+1].val += board[i][j].val
                                if board[i][j + 1].val != 0{
                                    score+=board[i][j+1].val
                                }
                                board[i][j] = board[i][j+1]
                                successShift = true

                            }else if board[i][j].val == 2 && board[i][j + 1].val == 1 || board[i][j + 1].val == 0{
                                board[i][j+1].val += board[i][j].val
                                if board[i][j + 1].val != 0{
                                    score+=board[i][j+1].val
                                }
                                board[i][j] = board[i][j+1]
                                successShift = true
                            }
                        }else if board[i][j].val == board[i][j + 1].val {
                            board[i][j+1].val += board[i][j].val
                            score+=board[i][j+1].val
                            board[i][j] = board[i][j+1]
                            successShift = true

                        }

                    }
                }
            }
            return successShift
        }

    // collapse in specified direction using shift() and rotate()
    func collapse(dir: Direction) {
        
        switch dir {
        case Direction.left:
            shift()
        case Direction.right:
            rotate()
            rotate()
            shift()
            rotate()
            rotate()
        case Direction.up:
            rotate()
            rotate()
            rotate()
            shift()
            rotate()
        case Direction.down:
            rotate()
            shift()
            rotate()
            rotate()
            rotate()
        }
        setRowsCols()
        gameOver = isGameOver(triplesGame: Triples(triplesGame: self))
    }
    
    
    func setRowsCols () {
        for row in 0..<4{
            for col in 0..<4{
                self.board[row][col].row = row
                self.board[row][col].col = col
            }
        }
    }
    // rotate a square 2D Int array clockwise
    func rotate(){
        board = rotate2D(input: board)
    }
}





// class-less function that will return of any square 2D Int array rotated clockwise
public func rotate2DInts(input: [[Int]]) -> [[Int]] {
    
    
    let n = input.count
    var temp = input
    
    for layer in 0..<n / 2
    {
        let head:Int = layer
        let last:Int = n - 1 - head
        for i in head..<last
        {
            let offset:Int = i - head
            let top:Int = temp[head][i]
            
            temp[head][i] = temp[last - offset][head]
            
            temp[last - offset][head] = temp[last][last - offset]
            
            temp[last][last - offset] = temp[i][last]
            
            temp[i][last] = top
        }
    }
    return temp
    
}

public func rotate2D<T>(input: [[T]]) -> [[T]] {
    
    
    
    let n = input.count
    var temp = input
    
    for layer in 0..<n / 2
    {
        let head:Int = layer
        let last:Int = n - 1 - head
        for i in head..<last
        {
            let offset:Int = i - head
            let top:T = temp[head][i]
            
            temp[head][i] = temp[last - offset][head]
            
            temp[last - offset][head] = temp[last][last - offset]
            
            temp[last][last - offset] = temp[i][last]
            
            temp[i][last] = top
        }
    }
    return temp
    
    
}
