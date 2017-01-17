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
    var label:UILabel!
    var label_2: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Label
        var label = UILabel()
        label.frame = CGRect(x: 150, y: 150, width: 60, height: 60)
        label.text = "0"
        self.view.addSubview(label)
        self.label = label
        
        label = UILabel()
        label.frame = CGRect(x: 200, y: 150, width: 60, height: 60)
        label.text = "0"
        self.view.addSubview(label)
        self.label_2 = label
        
        // Button
        var button = UIButton()
        button.frame = CGRect.init(x: 150, y: 250, width: 60, height: 60)
        button.setTitle("Click", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        self.view.addSubview(button)
        
        button.addTarget(self, action: #selector(ViewController.incrementCount), for: UIControlEvents.touchUpInside)
        
        button = UIButton()
        button.frame = CGRect.init(x: 150, y: 300, width: 60, height: 60)
        button.setTitle("Click", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        self.view.addSubview(button)
        
        button.addTarget(self, action: #selector(ViewController.decrementCount), for: UIControlEvents.touchUpInside)
        
        
        button = UIButton()
        button.frame = CGRect.init(x: 150, y: 350, width: 60, height: 60)
        button.setTitle("Click", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        self.view.addSubview(button)
        
        button.addTarget(self, action: #selector(ViewController.changeViewColor), for: UIControlEvents.touchUpInside)
        
    }
    
    func incrementCount() {
        self.count = self.count + 1
        self.label.text = "\(self.count)"
        self.label_2.text = "\(self.count)"
    }
    func decrementCount(){
        self.count = self.count - 1
        self.label.text = "\(self.count)"
        self.label_2.text = "\(self.count)"
    }
    func changeViewColor() {
        if self.view.backgroundColor != UIColor.cyan {
            self.view.backgroundColor = UIColor.cyan
        }else {
            self.view.backgroundColor = UIColor.white
        }
        
    }
    

}

