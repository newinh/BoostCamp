//
//  UpDownGame.swift
//  UpDownGame_SeungHoonShin
//
//  Created by 신승훈 on 2017. 1. 24..
//  Copyright © 2017년 BoostCamp. All rights reserved.
//

import Foundation


enum GameResult {
    case up
    case down
    case gameOver
    case right
    case error
    
    var question: Int {
        get {
            return UpDownGame.getSharedInstance().question
        }
    }
    
    var max : Int {
        get {
            return UpDownGame.getSharedInstance().max
        }
        set {
            UpDownGame.getSharedInstance().max = newValue
        }
    }
    
    var min : Int {
        get {
            return UpDownGame.getSharedInstance().min
        }
        set {
            UpDownGame.getSharedInstance().min = newValue
        }
    }
    
    var count : Int {
        get {
            return UpDownGame.getSharedInstance().count
        }
        set {
            UpDownGame.getSharedInstance().count = newValue
        }
    }
    
    
    func newGame(max num: Int) -> Bool{
        return UpDownGame.getSharedInstance().newGame(max: num)
    }
    
}

class UpDownGame {
    fileprivate var question : Int = 50
    fileprivate var max : Int = 100
    fileprivate var min : Int = 1
    fileprivate var count : Int = 5
    
    private static var singletonInstance : UpDownGame?
    
    private init(){
        
    }
    
    
    static func getSharedInstance() -> UpDownGame {
        if let instance = singletonInstance {
            return instance
        }
        singletonInstance = UpDownGame()
        return singletonInstance!
    }
    
    fileprivate func newGame(max: Int) -> Bool {
        self.max = max
        
        switch max {
        case 2...10:
            self.count = 5
        case 11...50:
            self.count = 10
        case 51...100:
            self.count = 20
        default:
            print("init fail : 올바르지 않는 시드값")
            return false
        }
        
        self.question = Int( arc4random_uniform(UInt32(max)) )  + 1
        return true
    }
    
}

func makeUpDownGame(num: Int) -> ( (Int) -> (GameResult) )? {
    
    var newGame : GameResult = .gameOver
    if newGame.newGame(max: num) == false {
        return nil
    }
    
    return {  (yourChoice : Int) in
        
        if newGame.count < 1 {
            return GameResult.gameOver
        }
        
        if newGame.question == yourChoice {
            return GameResult.right
        }
        
        switch yourChoice {
        case newGame.min ..< newGame.question :
            newGame.min = yourChoice
            newGame.count -= 1
            return GameResult.up
        case newGame.question...newGame.max:
            newGame.max = yourChoice
            newGame.count -= 1
            return GameResult.down
        default:
            print("잘못된 값을 입력하셨습니다.")
            return GameResult.error
        }
    }
}
