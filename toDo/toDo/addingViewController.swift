//
//  addingViewController.swift
//  toDo
//
//  Created by WJ on 3/6/18.
//  Copyright © 2018 WJ. All rights reserved.
//

import UIKit
class addingViewController: UIViewController{
    
    var toDoList2 = toDoListModel()
    
    @IBOutlet weak var input: UITextField!
    
    @IBAction func addPress(_ sender: Any) {
        
        if let thing = input.text{
            toDoList2.list!.append(thing)
            //toDoList.
            toDoList2.saveDate()
            input.text = ""
        }
    }
    
}
