//
//  ViewController.swift
//  FavoriteThings
//
//  Created by Jason Schatz on 11/18/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import UIKit

// MARK: - ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Model
    
    let favoriteThings: [String] = [
        "Raindrops on roses",
        "Whiskers on kittens",
        "Bright copper kettles",
        "Warm woolen mittens",
        "Brown paper packages tied up with string"
        //TODO: Fill this array with your favorite things. Then use this collection to populate your table.
    ]

    // MARK: Table View Data Source Methods
    
    // number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        // TODO: Implement this method to get the correct row count
//        let placeholderCount = 2
        return self.favoriteThings.count
    }
    
    // cell for row at index path
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteThingCell")!
        cell.textLabel?.text = self.favoriteThings[indexPath.row]
      
      // TODO: Implement method
      // 1. Dequeue a reusable cell from the table, using the correct “reuse identifier”
      // 2. Find the model object that corresponds to that row
      // 3. Set the images and labels in the cell with the data from the model object
      // 4. return the cell.
        
//        let placeholderCell = UITableViewCell()
        return cell
    }
}
