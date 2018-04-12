//
//  ViewController.swift
//  JSON
//
//  Created by Gustavo Severo on 19/09/17.
//  Copyright © 2017 Gustavo Severo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labeCep: UILabel!
    @IBOutlet weak var labelLogradouro: UILabel!
    @IBOutlet weak var labelBairro: UILabel!
    @IBOutlet weak var labelLocalidade: UILabel!
    @IBOutlet weak var labelUF: UILabel!
    
    @IBOutlet weak var textFieldCep: UITextField!
    @IBOutlet weak var textFieldLogradouro: UITextField!
    @IBOutlet weak var txtFieldBairro: UITextField!
    @IBOutlet weak var textFieldLocalidade: UITextField!
    @IBOutlet weak var textFieldUF: UITextField!
    
    var cep:String = ""
    var logradouro:String = ""
    var bairro:String = ""
    var cidade:String = ""
    var UF:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var cep:String = "91210120"
        let url = URL(string: "http://viacep.com.br/ws/"+cep+"/json/")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error != nil{
                print("ERROR")
            }else{
                
                if let conent = data{
                    
                    do{
                        let myJSON = try JSONSerialization.jsonObject(with: conent, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                            print(myJSON)
                        
                        cep = (myJSON["cep"] as! String) 
                        self.logradouro = (myJSON["logradouro"] as! String) 
                        self.bairro = (myJSON["bairro"] as! String) 
                        self.cidade = (myJSON["localidade"] as! String)
                        self.UF = (myJSON["uf"] as! String)

                        
                        self.labeCep.text = cep
                        self.labelLogradouro.text = self.logradouro
                        self.labelBairro.text = self.bairro
                        self.labelLocalidade.text = self.cidade
                        self.labelUF.text = self.UF
                        
                        self.textFieldCep.text = cep
                        self.textFieldLogradouro.text = self.logradouro
                        self.txtFieldBairro.text = self.bairro
                        self.textFieldLocalidade.text = self.cidade
                        self.textFieldUF.text = self.UF
                        
                    }catch{
                     //print(myJSON)
                    }
                }
                
            }
        }
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

