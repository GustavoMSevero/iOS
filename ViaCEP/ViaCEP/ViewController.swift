//
//  ViewController.swift
//  ViaCEP
//
//  Created by Gustavo Severo on 19/09/17.
//  Copyright © 2017 Gustavo Severo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfCep: UITextField!
    
    @IBOutlet weak var tfLogradouro: UITextField!
    @IBOutlet weak var tfBairro: UITextField!
    @IBOutlet weak var tfLocalidade: UITextField!
    @IBOutlet weak var tfUF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

