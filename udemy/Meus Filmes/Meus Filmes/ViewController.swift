//
//  ViewController.swift
//  Meus Filmes
//
//  Created by Gustavo Severo on 20/05/17.
//  Copyright © 2017 Gustavo Severo. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var filmes:[Filme] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    
        var filme: Filme
        
        filme = Filme(titulo: "007 - Spectre", descricao: "Descrição 1", imagem: #imageLiteral(resourceName: "filme1"))
        filmes.append( filme )
        
        filme = Filme(titulo: "Star Wars", descricao: "Descrição 2", imagem: #imageLiteral(resourceName: "filme2"))
        filmes.append( filme )
        
        filme = Filme(titulo: "Impacto Mortal", descricao: "Descrição 3", imagem: #imageLiteral(resourceName: "filme3"))
        filmes.append( filme )
        
        filme = Filme(titulo: "Deadpool", descricao: "Descrição 4", imagem: #imageLiteral(resourceName: "filme4"))
        filmes.append( filme )
        
        filme = Filme(titulo: "O Regresso", descricao: "Descrição 5", imagem: #imageLiteral(resourceName: "filme5"))
        filmes.append( filme )
        
        filme = Filme(titulo: "A Herdeira", descricao: "Descrição 6", imagem: #imageLiteral(resourceName: "filme6"))
        filmes.append( filme )
        
        filme = Filme(titulo: "Caçadores de emoção", descricao: "Descrição 7", imagem: #imageLiteral(resourceName: "filme7"))
        filmes.append( filme )
        
        filme = Filme(titulo: "Regresso do mal", descricao: "Descrição 8", imagem: #imageLiteral(resourceName: "filme8"))
        filmes.append( filme )
        
        filme = Filme(titulo: "Tarzan", descricao: "Descrição 9", imagem: #imageLiteral(resourceName: "filme9"))
        filmes.append( filme )
        
        filme = Filme(titulo: "Hardcore", descricao: "Descrição 10", imagem: #imageLiteral(resourceName: "filme10"))
        filmes.append( filme )
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let filme = filmes[ indexPath.row ]
        let celulaReuso = "celulaReuso"
        
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath) as! FilmeCelula
        celula.filmeImageView.image = filme.imagem
        celula.tituloLabel.text = filme.titulo
        celula.descricaoLabel.text = filme.descricao
        
        //Para arredondar a imagem
        celula.filmeImageView.layer.cornerRadius = 42
        celula.filmeImageView.clipsToBounds = true
        
        /*celula.textLabel?.text = filme.titulo
        celula.imageView?.image = filme.imagem*/
        
        return celula
        
    }
    
    // Usado para passar dados de um controller para outro
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detalheFilme" {
            
            if let IndexPath = tableView.indexPathForSelectedRow {
                
                let filmeSelecionado = self.filmes[ IndexPath.row ]
                let viewControllerDestino = segue.destination as! DetalhesFilmeViewController
                viewControllerDestino.filme = filmeSelecionado
                
            }
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

