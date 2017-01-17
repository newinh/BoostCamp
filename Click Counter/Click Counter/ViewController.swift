//
//  ViewController.swift
//  Click Counter
//
//  Created by 신승훈 on 2017. 1. 17..
//  Copyright © 2017년 BoostCamp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var count: Int = 0
    @IBOutlet var label:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func incrementCount() {
        self.count = self.count + 1
        self.label.text = "\(self.count)"
        
    }
}

