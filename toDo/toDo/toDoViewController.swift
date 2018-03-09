//
//  toDoViewController.swift
//  toDo
//
//  Created by WJ on 3/6/18.
//  Copyright © 2018 WJ. All rights reserved.
//

import UIKit

class toDoViewController: UITableViewController{
    
    var toDoList2 = toDoListModel()
    
    
    @IBAction func addPress(_ sender: Any) {
         performSegue(withIdentifier: "addTransition", sender: self)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return toDoList.count
        if let counter = toDoList2.list{
            return counter.count
        }else{
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        if let test = toDoList2.list{
            cell.textLabel?.text = test[indexPath.row]
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete{
            toDoList2.list!.remove(at: indexPath.row)
            toDoList2.saveDate()
            tableView.reloadData()
        }
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        toDoList2.loadData()
        tableView.reloadData()
    }
    
}
