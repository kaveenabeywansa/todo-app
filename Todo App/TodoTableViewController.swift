//
//  TodoTableViewController.swift
//  Todo App
//
//  Created by Kaveen Abeywansa on 8/21/19.
//  Copyright © 2019 Kaveen Abeywansa. All rights reserved.
//

import UIKit

class TodoTableViewController: UITableViewController {

    var toDos: [ToDoCoreDate] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getToDos()
    }

    func getToDos() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            if let coreDataTodos = try? context.fetch(ToDoCoreDate.fetchRequest()) as? [ToDoCoreDate] {
                if let theToDos = coreDataTodos {
                    toDos = theToDos
                    tableView.reloadData()
                }
            }
            
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        let toDo = toDos[indexPath.row]
        
        if let name = toDo.name {
            cell.textLabel?.text = name
        }
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toDo = toDos[indexPath.row]
        performSegue(withIdentifier: "moveToComplete", sender: toDo)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addVC = segue.destination as? AddTodoViewController {
            addVC.previousVC = self
        }
        
        if let completeVC = segue.destination as? CompleteTodoViewController {
            if let toDo = sender as? ToDoCoreDate {
                completeVC.selectedTodo = toDo
                completeVC.previousVC = self 
            }
        }
    }
    
}
