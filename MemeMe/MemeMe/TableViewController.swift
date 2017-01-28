//
//  TableViewController.swift
//  MemeMe
//
//  Created by 신승훈 on 2017. 1. 28..
//  Copyright © 2017년 BoostCamp. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Meme.memes.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)

        let meme = Meme.memes[indexPath.row]
        
        let tableViewImage = cell.viewWithTag(1) as! UIImageView
        let tableViewTextLabel = cell.viewWithTag(2) as! UILabel
        tableViewTextLabel.text = "\(meme.stringTime)\n\(meme.topText)\n\(meme.bottomText)"
        tableViewImage.image = meme.memedImage
        
        return cell
    }

    
    // 선택한 meme를 다시 viewController에 전달한다.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let viewController = self.storyboard!.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let meme = Meme.memes[indexPath.row]
        viewController.meme = meme
        viewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    // cell 높이
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    // MARK: IBAction
    @IBAction func newMeme() {
        let viewController = self.storyboard!.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        viewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
