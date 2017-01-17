//
//  ResultViewController.swift
//  Roshambo
//
//  Created by 신승훈 on 2017. 1. 18..
//  Copyright © 2017년 BoostCamp. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var imageView : UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var me : Roshambo?
    var you : Roshambo?
    

    override func viewWillAppear(_ animated: Bool) {

        if let me = self.me , let you = self.you {
            
            switch (me, you) {
            case (.rock, .scissors):
                self.imageView.image = UIImage(named: "RockCrushesScissors")
                self.label.text = "YOU WIN!"
            case (.rock, .paper):
                self.imageView.image = UIImage(named: "PaperCoversRock")
                self.label.text = "YOU LOSE!"
            case (.scissors, .paper):
                self.imageView.image = UIImage(named: "ScissorsCutPaper")
                self.label.text = "YOU WIN!"
            case (.scissors, .rock):
                self.imageView.image = UIImage(named: "RockCrushesScissors")
                self.label.text = "YOU LOSE!"
            case (.paper, .rock):
                self.imageView.image = UIImage(named: "PaperCoversRock")
                self.label.text = "YOU WIN!"
            case (.paper, .scissors):
                self.imageView.image = UIImage(named: "ScissorsCutPaper")
                self.label.text = "YOU LOSE!"
                
                
            default:
                self.imageView.image = UIImage(named: "itsATie")
                self.label.text = "DRAW!"
                
            }
            
            
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.3){
            self.imageView.alpha = 1
        }
    }
    
    @IBAction func dismiss(){
        self.dismiss(animated: true, completion: nil)
    }
}
