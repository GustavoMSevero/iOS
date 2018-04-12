//
//  ExibeDadoViewController.swift
//  Passando Dado entre views
//
//  Created by Gustavo Severo on 23/08/17.
//  Copyright © 2017 Gustavo Severo. All rights reserved.
//

import Foundation
import UIKit

class ExibeDadoViewController: UIViewController {
    
    @IBOutlet weak var lblRecuperaDado: UILabel!
    var textoRecebido: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        lblRecuperaDado.text = textoRecebido
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
