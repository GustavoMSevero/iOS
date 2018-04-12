//
//  ViewController.swift
//  Listagem de dados
//
//  Created by Gustavo Severo on 23/08/17.
//  Copyright © 2017 Gustavo Severo. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var dados: [String] = ["Lazanha", "Pizza", "Churrasco"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Número de sessões
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Número dados na sessão, nesse caso 3
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dados.count
    }
    
    //Método que monta a célula
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //identificador da celula da tableview
        let celulaReuso = "celulaReuso"
        //Configura célula para reuso
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath)
        //Define os dados do array na celula de reuso
        celula.textLabel?.text = dados[ indexPath.row ]
        
        return celula
        
    }


}

