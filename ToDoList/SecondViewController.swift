//
//  SecondViewController.swift
//  ToDoList
//
//  Created by Im100ruv on 14/02/18.
//  Copyright © 2018 Im100ruv. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var taskTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func addTask(_ sender: Any) {
        let tasksObject = UserDefaults.standard.object(forKey: "tasks")
        
        var tasks:[String]
        if let temptask = tasksObject as? [String] {
            tasks = temptask
            tasks.append(taskTextField.text!)
        } else {
            tasks = [taskTextField.text!]
        }
        
        UserDefaults.standard.set(tasks, forKey: "tasks")
        taskTextField.text = ""
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

