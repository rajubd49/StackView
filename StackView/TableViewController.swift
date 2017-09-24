//
//  TableViewController.swift
//  StackView
//
//  Created by Raju on 8/10/17.
//  Copyright © 2017 rajubd49. All rights reserved.
//

import UIKit

class TableViewController: UIViewController{

    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var mainStackViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var leftTableView: UITableView!
    @IBOutlet weak var rightTableView: UITableView!
    
    let movies = ["Movie StackView", "The Avengers", "Wonder Woman", "Batman", "Deadpool", "Spider-Man", "Captain America", "X-Men", "Superman", "Iron Man", "Ant-Man", "Hulk", "Thor", "Suicide Squad", "Terminator", "Transformer", "Back to the Future", "Gladiator"]
    let seasons = ["Season StackView", "Game of Thrones", "Breaking Bad", "Sherlock", "Fargo", "Dexter", "Westworld", "Friends", "Stranger Things", "The Big Bang Theory", "13 Reasons Why", "Into the Badlands", "Prison Break", "How I Met Your Mother", "Doctor Who", "The Walking Dead", "Vikings", "House of Cards"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        leftTableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        rightTableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLayoutSubviews() {
         super.viewDidLayoutSubviews()
    
        if (UIDevice.current.orientation.isLandscape) {
            mainStackView.axis = .horizontal
            mainStackViewHeightConstraint.constant = CGFloat(45 * movies.count) //Cell Size * Number Of Cell
        } else {
            mainStackView.axis = .vertical
            mainStackViewHeightConstraint.constant = CGFloat(45 * movies.count * 2) //Cell Size * Number Of Cell * No Of Table
        }
    }
}

extension TableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        
        cell.textLabel?.text = tableView == leftTableView ? movies[indexPath.row] : seasons[indexPath.row]
        return cell;
    }
}

extension TableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
