//
//  ViewController.swift
//  Core Data
//
//  Created by Gustavo Severo on 09/06/17.
//  Copyright © 2017 Gustavo Severo. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Configurações iniciais Core Data
        //let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        //PesistenContainer pesiste dados no DB
        //let context = appDelegate.persistentContainer.viewContext
        
        //Salvar dados no Core Data
        /*let usuario = NSEntityDescription.insertNewObject(forEntityName: "Usuarios", into: context)
        
        //Configurar objeto
        usuario.setValue("marianaalencastro", forKey: "loginUsuario")
        usuario.setValue("mari123", forKey: "senha")
        usuario.setValue("Mariana Alencastro", forKey: "nome")
        usuario.setValue(35, forKey: "idade")
        
        do {
            
            try context.save()
            print("Dados salvos com sucesso")
        
        }catch{
            print("Erro ao salvar dados")
        }*/
        
        /*let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Usuarios")
        
        do {
            
            let usuarios = try context.fetch( requisicao )
            
            //Verifica se existe usuarios
            if usuarios.count > 0 {
                
                for usuario in usuarios {
                    
                    if let nomeUsuario = (usuario as AnyObject).value(forKey: "nome") {
                        
                        print( nomeUsuario )
                        
                    }
                    
                }
                
            }else{
                print("Nenhum usuário encontrado")
            }
            
        }catch{
            print("Erro ao recuperar os dados")
        }*/
        
        //Salvando dados
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let contextProduto = appDelegate.persistentContainer.viewContext
        
        /*let produto = NSEntityDescription.insertNewObject(forEntityName: "Produtos", into: contextProduto)
        
        //Configura objeto
        produto.setValue("Galaxy tab 3", forKey: "nome")
        produto.setValue("Samsung Galaxy", forKey: "descricao")
        produto.setValue("Preto", forKey: "cor")
        produto.setValue(200.00, forKey: "preco")
        
        do {
           
            try contextProduto.save()
            print("Sucesso ao salvar produto")
            
        }catch{
            print("Erro ao salvar produto")
        }*/
        
        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Produtos")
        
        do {
            
            let produtos = try contextProduto.fetch( requisicao )
            
            if produtos.count > 0 {
                
                for produto in produtos {
                    
                    if let nomeProduto = (produto as AnyObject).value(forKey: "nome"){
                        
                        print( nomeProduto )
                        
                    }
                    
                }
                
            }
            
        }catch{
            print("Nenhum produto encontrado")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

