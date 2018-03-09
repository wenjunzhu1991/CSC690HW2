//
//  toDoViewController.swift
//  toDo
//
//  Created by WJ on 3/6/18.
//  Copyright © 2018 WJ. All rights reserved.
//

import UIKit

var toDoList = ["buy food", "buy water", "run"]

class toDoViewController: UITableViewController{
    
    
    @IBAction func addPress(_ sender: Any) {
         performSegue(withIdentifier: "addTransition", sender: self)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = toDoList[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete{
            toDoList.remove(at: indexPath.row)
            tableView.reloadData()
        }
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
}
