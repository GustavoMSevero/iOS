//
//  ViewController.swift
//  PickerView
//
//  Created by Gustavo Severo on 28/08/17.
//  Copyright © 2017 Gustavo Severo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var dataPicker: UIPickerView!
    
    var estabelecimentos: [String] = ["Cabeleireiros", "Restaurantes", "Casa de Festas", "Cinema"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataPicker.delegate = self
        dataPicker.dataSource = self
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return estabelecimentos.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return estabelecimentos[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        labelTitulo.text = estabelecimentos[row]
    }

}

