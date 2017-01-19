//
//  CashTextFieldDelegate.swift
//  TextFields
//
//  Created by 신승훈 on 2017. 1. 19..
//  Copyright © 2017년 Udacity. All rights reserved.
//

import Foundation
import UIKit

class CashTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // 숫자 or delete만 입력되는 것으로 가정
        // textField.text : $13.40 꼴
        
        var oldText : String = textField.text ?? ""
        if oldText.isEmpty {
           oldText = "$00.00"
        }
        
        let commaIndex = oldText.characters.index(of: ".")!
        let startIndex = oldText.index(oldText.startIndex, offsetBy: 1)
        
        var dollarString : String = oldText.substring(with: startIndex ..< commaIndex)
        var centString : String = oldText.substring(from: oldText.index(after: commaIndex))
        
        if let _ = Int(string){
            let moveString = String(centString.characters.removeFirst())
            dollarString = dollarString + moveString
            centString += string
        }else {
            let moveString = String(dollarString.characters.removeLast())
            centString = moveString + centString
            centString.characters.removeLast()
        }
        
        
        if dollarString.characters.count < 2 {
            dollarString = "0" + dollarString
        }else if dollarString.characters.index(of: "0") == dollarString.startIndex {
            dollarString.characters.removeFirst()
        }
        
        textField.text = "$\(dollarString).\(centString)"
        
        return false
    }
    
}
