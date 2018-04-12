//
//  ViewController.swift
//  Passando Dado entre views
//
//  Created by Gustavo Severo on 23/08/17.
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
        //Verifica se é a segue de destino
        if (segue.identifier == "enviaDado") {
            //Atribui a variável a classe de destino
            let viewControllerDestino = segue.destination as! ExibeDadoViewController
            //Atribui o valor da textField a lebal de destino
            viewControllerDestino.textoRecebido = nomeTextField.text
        }
    }

}

