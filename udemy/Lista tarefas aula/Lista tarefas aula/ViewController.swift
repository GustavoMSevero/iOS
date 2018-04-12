//
//  ViewController.swift
//  Lista tarefas aula
//
//  Created by Jamilton  Damasceno
//  Copyright © 2016 Jamilton  Damasceno. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var tarefas: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        atualizarListaTarefas()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tarefas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celulaReuso = "celulaReuso"
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath)
        celula.textLabel?.text = tarefas[ indexPath.row ]
        
        return celula
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            
            let tarefaUserDefault = TarefaUserDefaults()
            tarefaUserDefault.removerTarefa( indice: indexPath.row )
            
            atualizarListaTarefas()
            tableView.reloadData()
            
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        atualizarListaTarefas()
        tableView.reloadData()
        
    }
    
    func atualizarListaTarefas(){
        
        let tarefaUserDefaults = TarefaUserDefaults()
        tarefas = tarefaUserDefaults.listarTarefas()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

