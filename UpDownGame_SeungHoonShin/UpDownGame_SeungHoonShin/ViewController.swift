//
//  ViewController.swift
//  UpDownGame_SeungHoonShin
//
//  Created by 신승훈 on 2017. 1. 24..
//  Copyright © 2017년 BoostCamp. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var rangeText: UILabel!
    @IBOutlet weak var guideText: UILabel!
    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var resultImageView: UIImageView!
    
    var status : GameResult = .gameOver
    var gameManager :  ( (Int) -> GameResult )?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        guideText.text = "게임생성 시드값을 입력하세요!"
        rangeText.text = "2 ~ 100"
        
        inputText.delegate = self
    }

    @IBAction func buttonPressed(_ sender: Any) {
        
        guard let text = inputText.text, let inputNumber = Int(text) else{
            guideText.text = "숫자를 입력해"
            return
        }
        
        if gameManager == nil  {
            // 새로운 게임 생성
            gameManager = makeUpDownGame(num: inputNumber)
            
            if gameManager == nil {
                guideText.text = "게임 생성 실패 : 올바른 시드값을 입력하려므나"
                inputText.resignFirstResponder()
                return
            }
            
            guideText.text = "게임 시작!"
            resultImageView.image = nil
            inputText.resignFirstResponder()
            return
        }
        
        
        status = gameManager!(inputNumber) // 게임 실행
        
        switch status {
        case .gameOver :
            resultImageView.image = UIImage(named: "gameOver")
            guideText.text = "게임 오버"
            rangeText.text = "시드를 입력하면 새로 시작"
            gameManager = nil
            
        case .right :
            resultImageView.image = UIImage(named: "right")
            guideText.text = "정답!"
            rangeText.text = "시드를 입력하면 새로 시작"
            gameManager = nil
            
        case .up :
            resultImageView.image = UIImage(named: "up")
            guideText.text = "UP!"
            rangeText.text = " \(status.min) ... \(status.max)"
            
        case .down :
            resultImageView.image = UIImage(named: "down")
            guideText.text = "DOWN!"
            rangeText.text = " \(status.min) ... \(status.max)"
            
        case .error :
            resultImageView.image = nil
            guideText.text = "ERROR!"
            rangeText.text = "잘 생각해\n\(status.min) ... \(status.max)"
            
        }
        
        inputText.resignFirstResponder()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
}

