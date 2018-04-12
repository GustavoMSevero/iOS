//
//  TarefaUserDefaults.swift
//  Lista tarefas aula
//
//  Created by Jamilton  Damasceno
//  Copyright © 2016 Jamilton  Damasceno. All rights reserved.
//

import UIKit

class TarefaUserDefaults{
    
    let chaveListaTarefa = "listaTarefa"
    var tarefas: [String] = []
    
    func salvarTarefa(tarefa: String){
        
        //recupera tarefas
        tarefas = listarTarefas()
        
        //adicionar
        tarefas.append( tarefa )
        UserDefaults.standard.set( tarefas , forKey: chaveListaTarefa )
        
    }
    
    func listarTarefas() -> Array<String> {
        
        let dados = UserDefaults.standard.object(forKey: chaveListaTarefa )
        
        if dados != nil {
            return dados as! Array
        }else{
            return []
        }
        
    }

    
    func removerTarefa( indice: Int ){
        
        //recupera tarefas
        tarefas = listarTarefas()
        
        tarefas.remove(at: indice )
        
        UserDefaults.standard.set( tarefas , forKey: chaveListaTarefa )
        
    }
    
}
