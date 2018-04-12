//
//  ArmazenamentoDados.swift
//  Minhas viagens
//
//  Created by Gustavo Severo on 01/06/17.
//  Copyright © 2017 Gustavo Severo. All rights reserved.
//

import UIKit

class ArmazenamentoDados {
    
    let chaveArmazenamento = "locaisViagem"
    var viagens: [ Dictionary<String, String> ] = []
    
    func getDefaults() -> UserDefaults {
        return UserDefaults.standard
    }
    
    func salvarViagem( viagem: Dictionary<String, String> ){
        
        viagens = listaViagens()
        
        viagens.append( viagem )
        
        getDefaults().set( viagens, forKey: chaveArmazenamento )
        getDefaults().synchronize()
        
        
    }
    
    func listaViagens() -> [ Dictionary<String, String> ]{
        
        let dados = getDefaults().object(forKey: chaveArmazenamento)
        if dados != nil{
            return dados as! Array
        }else{
            return []
        }
        
    }
    
    func removerViagem(indice: Int){
        
        viagens = listaViagens()
        viagens.remove(at: indice)
        
        getDefaults().set( viagens, forKey: chaveArmazenamento )
        getDefaults().synchronize()
        
    }
    
}
