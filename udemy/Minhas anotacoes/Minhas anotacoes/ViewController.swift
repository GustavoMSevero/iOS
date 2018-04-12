//
//  ViewController.swift
//  Minhas anotacoes
//
//  Created by Gustavo Severo on 23/05/17.
//  Copyright © 2017 Gustavo Severo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textoTextView: UITextView!
    let minhaAnotacaoChave = "minha anotacao"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Recuperar dados
        let textoRecuperado = self.recuperarDadosAnotacao()
        textoTextView.text = textoRecuperado
    }
    
    @IBAction func salvarAnotacao(_ sender: Any) {
        
        //Pegar o texto digitado
        if let texto = textoTextView.text {
            
            self.salvarDadosAnotacao(texto: texto)
            esconderTeclado()
            
        }
        
    }
    
    func salvarDadosAnotacao( texto:String ){
        
        UserDefaults.standard.set(texto, forKey: minhaAnotacaoChave)
        
    }
    
    //Função recuperar Dados
    func recuperarDadosAnotacao() -> String {
        
        let textoRecuperado = UserDefaults.standard.object(forKey: minhaAnotacaoChave)
        
        if textoRecuperado != nil {
            return textoRecuperado as! String
        }else{
            return ""
        }
        
    }
    
    func esconderTeclado() {
        view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        esconderTeclado()
    }
    
    //Esconde a barra de status
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

