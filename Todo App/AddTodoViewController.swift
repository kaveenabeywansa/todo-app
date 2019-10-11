//
//  AddTodoViewController.swift
//  Todo App
//
//  Created by Kaveen Abeywansa on 8/21/19.
//  Copyright © 2019 Kaveen Abeywansa. All rights reserved.
//

import UIKit

class AddTodoViewController: UIViewController {

    var previousVC = TodoTableViewController()
    
    @IBOutlet weak var desc: UITextView!
    @IBOutlet weak var titleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        desc!.layer.borderWidth = 1
        desc!.layer.borderColor = UIColor.lightGray.cgColor
    }
    @IBAction func addTapped(_ sender: UIButton) {
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let toDo = ToDoCoreDate(context: context )
            
            if let titleText = titleTextField.text {
                toDo.name = titleText
                toDo.desc = desc.text
            }
            try? context.save()
            navigationController?.popViewController(animated: true) 
        }
    }
    
}
