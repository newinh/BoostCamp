//
//  MYOAViewController.swift
//  MYOA
//
//  Created by 신승훈 on 2017. 1. 26..
//  Copyright © 2017년 BoostCamp. All rights reserved.
//

import Foundation
import UIKit

class MYOAViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Start Over", style: .plain, target: self, action: #selector(startOver))
        print("didLoad")
    }
    
    func startOver() {
        if let navigationController = self.navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
    deinit {
        print("deinit")
    }
}
