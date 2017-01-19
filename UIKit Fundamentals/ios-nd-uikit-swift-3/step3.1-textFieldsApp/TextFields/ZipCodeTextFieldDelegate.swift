//
//  ZipCodeTextFieldDelegate.swift
//  TextFields
//
//  Created by 신승훈 on 2017. 1. 19..
//  Copyright © 2017년 Udacity. All rights reserved.
//

import Foundation
import UIKit

class ZipCodeTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
//        print((textField.text?.characters.count)! , range.location)
        
        /*
         textField 는 수정되기 `전`의 TextField를 가리킨다.
         range.location은 수정이 시작되는 위치. (0부터 센다.)
         
         수정되기전에 5글자가 있는 상태에서, 6번째 위치에 글자를 추가하는 경우에 수정을 허락하지 않는다.
         
         
         (count는 갯수를 나타내고
         location은 string의 위치를 0부터 세서 좀 헷갈린다😝)
         */
 
        if (textField.text?.characters.count)! > 4  && range.location > 4{
            return false
        }
        return true
    }
}
