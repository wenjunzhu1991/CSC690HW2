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
    var done: Bool = false
    
    @IBOutlet weak var doneSwith: UISwitch!
    
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
        
       let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "toDolistCell")
        //let cell = tableView.dequeueReusableCell(withIdentifier: "toDolistCell")
        if let test = toDoList2.list{
            cell.textLabel?.text = test[indexPath.row]
        }
        return cell
    }
    

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //let cell = tableView.cellForRow(at: indexPath)
        
        toDoList2.list![indexPath.row] = "done!"
        toDoList2.saveDate()
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]{
        
        let editAction = UITableViewRowAction(style: .normal, title: "Edit", handler: { (action, indexPath) in
            let alert = UIAlertController(title: "", message: "Edit list item", preferredStyle: .alert)
            alert.addTextField(configurationHandler: { (textField) in
                textField.text = self.toDoList2.list![indexPath.row]
            })
            alert.addAction(UIAlertAction(title: "Update", style: .default, handler: { (updateAction) in
                self.toDoList2.list![indexPath.row] = alert.textFields!.first!.text!
                self.toDoList2.saveDate()
                self.tableView.reloadRows(at: [indexPath], with: .fade)
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: false)
        })
        
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: { (action, indexPath) in
            self.toDoList2.list!.remove(at: indexPath.row)
            self.toDoList2.saveDate()
            tableView.reloadData()
        })
        
        return [deleteAction, editAction]
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        toDoList2.loadData()
        tableView.reloadData()
    }
    
}
