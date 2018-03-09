//
//  toDoListModel.swift
//  toDo
//
//  Created by WJ on 3/9/18.
//  Copyright © 2018 WJ. All rights reserved.
//

import UIKit

class toDoListModel{
    var list:[String]?
    let userDefault = UserDefaults.standard
    
    init(){
        //list = userDefault.array(forKey: "list") as? [String]
        if let test = userDefault.array(forKey: "list") as? [String]{
            list = test
        }else{
            list = [""]
        }
    }
    
    func saveDate(){
        userDefault.set(list, forKey: "list")
    }
    
    func loadData(){
        list = userDefault.array(forKey: "list") as? [String]
    }
    
}
