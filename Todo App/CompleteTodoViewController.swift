//
//  CompleteTodoViewController.swift
//  Todo App
//
//  Created by Kaveen Abeywansa on 8/22/19.
//  Copyright © 2019 Kaveen Abeywansa. All rights reserved.
//

import UIKit

class CompleteTodoViewController: UIViewController {
    
    @IBOutlet weak var desc: UILabel!
    var previousVC = TodoTableViewController()
    var selectedTodo : ToDoCoreDate?
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func completeTapped(_ sender: UIButton) {
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            if let theTodo = selectedTodo {
                context.delete(theTodo)
                navigationController?.popViewController(animated: true)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = selectedTodo?.name
        desc.text = selectedTodo?.desc
    }

}
