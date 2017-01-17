//
//  ViewController.swift
//  Click Counter
//
//  Created by 신승훈 on 2017. 1. 17..
//  Copyright © 2017년 BoostCamp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Label
        var label = UILabel()
        label.frame = CGRect(x: 150, y: 150, width: 60, height: 60)
        label.text = "0"
        self.view.addSubview(label)
        
        // Button
        var button = UIButton()
        label.text = "\(type(of: button))"
        button.frame = CGRect.init(x: 120, y: 150, width: 60, height: 60)
        button.setTitle("Click", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        self.view.addSubview(button)
        
        
    }


}

