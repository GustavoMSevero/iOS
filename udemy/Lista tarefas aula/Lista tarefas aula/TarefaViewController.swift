//
//  TarefaViewController.swift
//  Lista tarefas aula
//
//  Created by Jamilton  Damasceno
//  Copyright © 2016 Jamilton  Damasceno. All rights reserved.
//

import UIKit

class TarefaViewController: UIViewController {
    
    @IBOutlet weak var tarefaTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func adicionarTarefa(_ sender: AnyObject) {
        
        if let tarefa = tarefaTextField.text {
            
            let tarefaUserDefaults = TarefaUserDefaults()
            tarefaUserDefaults.salvarTarefa( tarefa: tarefa )
            tarefaTextField.text = ""
            
        }
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
