//
//  ViewController.swift
//  Roshambo
//
//  Created by 신승훈 on 2017. 1. 18..
//  Copyright © 2017년 BoostCamp. All rights reserved.
//

import UIKit

enum Roshambo: Int {
    case rock, scissors, paper
}

class ViewController: UIViewController {
    

    func rand() -> Int {
        
        return Int(arc4random() % 3 )
    }

    
    @IBAction func codeButtonPressed(_ sender: AnyObject)  {
        
        let controller : ResultViewController
        controller = self.storyboard?.instantiateViewController(withIdentifier: "resultView") as! ResultViewController
        
        controller.me = Roshambo.rock
        controller.you = Roshambo(rawValue: rand())
        
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func codeAndSegueButtonPressed(_ sender: AnyObject) {
        performSegue(withIdentifier: "codeSegue", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let controller = segue.destination as! ResultViewController
        
        if segue.identifier == "codeSegue" {
            
            controller.me = Roshambo.scissors
            
        }else {
            controller.me = Roshambo.paper
        }
        
        controller.you = Roshambo(rawValue: rand())
    }

}

