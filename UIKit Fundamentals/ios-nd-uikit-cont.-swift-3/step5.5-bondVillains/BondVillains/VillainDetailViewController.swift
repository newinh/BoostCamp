//
//  VillainDetailViewController.swift
//  BondVillains
//
//  Created by 신승훈 on 2017. 1. 26..
//  Copyright © 2017년 Udacity. All rights reserved.
//

import Foundation
import UIKit

class VillainDetailViewController : UIViewController {
    
    var villain : Villain!
    @IBOutlet weak var imageView : UIImageView!
    @IBOutlet weak var label :  UILabel!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        imageView.image =  UIImage(named: villain.imageName)
        label.text = villain.name
    }
}
