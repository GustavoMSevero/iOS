//
//  ViewController.swift
//  Signos
//
//  Created by Gustavo Severo on 19/05/17.
//  Copyright © 2017 Gustavo Severo. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var signos:[String] = []
    var significado:[String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Configura signos
        signos.append("Áries")
        signos.append("Touro")
        signos.append("Gêmeos")
        signos.append("Câncer")
        signos.append("Leão")
        signos.append("Virgem")
        signos.append("Libra")
        signos.append("Escorpião")
        signos.append("Sagitário")
        signos.append("Capricórnio")
        signos.append("Aquário")
        signos.append("Peixes")
        
        //Configura significados
        significado.append("Blablablabla Áries")
        significado.append("Blablablabla Touro")
        significado.append("Blablablabla Gêmeos")
        significado.append("Blablablabla Câncer")
        significado.append("Blablablabla Leão")
        significado.append("Blablablabla Virgem")
        significado.append("Blablablabla Libra")
        significado.append("Blablablabla Escorpião")
        significado.append("Blablablabla Sagitário")
        significado.append("Blablablabla Capricórnio")
        significado.append("Blablablabla Aquário")
        significado.append("Blablablabla Peixes")
        
    }
    
    //Número de sessões do array (nesse caso apenas 1)
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Define quantas linhas
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return signos.count
    }
    
    //Monta a visualização
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celulaReuso = "celulaReuso"
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath)
        celula.textLabel?.text = signos[ indexPath.row ] //Especifica a linha
        
        return celula
    }
    
    //Tratamento do clique em cada linha
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        //Cria o alerta
        let alertaController = UIAlertController(title: "Significado do signo", message: significado[ indexPath.row ], preferredStyle: .alert)
        
        //Cria a ação de OK
        let acaoConfirmar = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        //Adiciona a ação de OK ao alerta
        alertaController.addAction(acaoConfirmar)
        
        //Exibe o alerta
        present(alertaController, animated: true, completion: nil)
        
        //print( significado[ indexPath.row ] )
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

