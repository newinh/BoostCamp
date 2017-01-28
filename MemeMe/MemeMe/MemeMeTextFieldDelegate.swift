//
//  MemeMeTextFieldDelegate.swift
//  MemeMe
//
//  Created by 신승훈 on 2017. 1. 28..
//  Copyright © 2017년 BoostCamp. All rights reserved.
//

import UIKit

class MemeMeTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.becomeFirstResponder()
        textField.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
