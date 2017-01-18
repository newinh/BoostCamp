//
//  RandomColorizerTextFieldDelegate.swift
//  TextFields
//
//  Created by 신승훈 on 2017. 1. 19..
//  Copyright © 2017년 Udacity. All rights reserved.
//

import Foundation
import UIKit

class RandomColorizerTextFieldDelegate: NSObject, UITextFieldDelegate {
    let colors: [UIColor] = [.red, .orange, .yellow, .green, .blue, .purple, .brown]
    
    func randomColor() -> UIColor {
        let randomIndex = Int(arc4random() % UInt32(colors.count))
        return colors[randomIndex]
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        textField.textColor = randomColor()
        
        return true
    }
}
