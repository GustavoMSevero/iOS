//
//  Filme.swift
//  Meus Filmes
//
//  Created by Gustavo Severo on 20/05/17.
//  Copyright © 2017 Gustavo Severo. All rights reserved.
//

import UIKit

class Filme{

    var titulo: String!
    var descricao: String!
    var imagem: UIImage!
    
    init(titulo: String, descricao: String, imagem: UIImage) {
        
        self.titulo = titulo
        self.descricao = descricao
        self.imagem = imagem
        
    }

}
