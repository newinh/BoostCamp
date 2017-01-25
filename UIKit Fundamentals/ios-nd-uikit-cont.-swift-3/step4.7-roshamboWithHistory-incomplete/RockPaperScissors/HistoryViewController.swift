//
//  HistoryViewController.swift
//  RockPaperScissors
//
//  Created by 신승훈 on 2017. 1. 25..
//  Copyright © 2017년 Gabrielle Miller-Messner. All rights reserved.
//

import Foundation
import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var history = [RPSMatch]()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell")!
        
        let match = history[indexPath.row]
        
        let titleLabel = cell.viewWithTag(1) as! UILabel
        let detailLabel = cell.viewWithTag(2) as! UILabel
        let myImageView = cell.viewWithTag(3) as! UIImageView
        let yourImageView = cell.viewWithTag(4) as! UIImageView
        
        imageMatching(imageView: myImageView, rps: match.p1)
        imageMatching(imageView: yourImageView, rps: match.p2)
        
        if match.p1 == match.p2 {
            titleLabel.text = "Draw!"
        }else{
            titleLabel.text = match.p1.defeats(match.p2) ? "Win!" : "Lose!"
        }
        
        detailLabel.text = match.p1.description + " vs " + match.p2.description
        
        
        return cell
    }
    
    func imageMatching(imageView: UIImageView, rps: RPS) {
        switch rps {
        case .paper:
            imageView.image = UIImage(named: "paper")
        case .rock:
            imageView.image = UIImage(named: "rock")
        case .scissors:
            imageView.image = UIImage(named: "scissors")
        }
    }
    
}
