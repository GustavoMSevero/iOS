//
//  ViewController.swift
//  Passando dados entre views
//
//  Created by Gustavo Severo on 22/05/17.
//  Copyright © 2017 Gustavo Severo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nomeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //Verifica se é a segue que queremos
        if segue.identifier == "enviarDadosDetalhes" {
            
            //Para passar o(s) dado(s) para a tela/controller de destino
            let viewControllerDestino = segue.destination as! DetalhesViewController
            viewControllerDestino.textoRecebido = nomeTextField.text
            
        }
        
    }


}

