//
//  ViewController.swift
//  Minhas viagens
//
//  Created by Gustavo Severo on 31/05/17.
//  Copyright © 2017 Gustavo Severo. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapa: MKMapView!
    var gerenciadorLocalizacao = CLLocationManager()
    var viagem: Dictionary<String, String> = [:]
    var indiceSelecionado: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let indice = indiceSelecionado {
            
            if indice == -1{//adicionar
                
                configuraGerenciadorLocalizacao()
                
            }else{//listar
                
                exibirAnotacao( viagem: viagem )
                
            }
        }
        
        let reconhecedorGesto = UILongPressGestureRecognizer(target: self, action: #selector( ViewController.marcar(gesture:) ))
        reconhecedorGesto.minimumPressDuration = 2
        
        mapa.addGestureRecognizer( reconhecedorGesto )
    }
    
    func exibirAnotacao(viagem: Dictionary<String, String>){
        
        if let localViagem = viagem["local"] {
            
            if let latitudeS = viagem["latitude"] {
                
                if let longitudeS = viagem["longitude"] {
                    
                    if let latitude = Double(latitudeS) {
                        
                        if let longitude = Double(longitudeS) {
                            
                            //exibe local
                            
                            
                            let anotacao = MKPointAnnotation()
                            
                            anotacao.coordinate.latitude = latitude
                            anotacao.coordinate.longitude = longitude
                            anotacao.title = localViagem
                            
                            self.mapa.addAnnotation( anotacao )
                            
                        }
                        
                    }
                    
                }
                
            }
            
        }
        
    }
    
    func marcar(gesture: UIGestureRecognizer) {
        
        if gesture.state == UIGestureRecognizerState.began {
            
            //Recupera as coordenadas do ponto selecionado
            let pontoSelecionado = gesture.location( in: self.mapa )
            let coordenadas = mapa.convert( pontoSelecionado, toCoordinateFrom: self.mapa )
            let localizacao = CLLocation(latitude: coordenadas.latitude, longitude: coordenadas.longitude)
            
            //Recupera endereço do ponto selecionado
            var localCompleto = "Endereço não encontrado"
            CLGeocoder().reverseGeocodeLocation(localizacao, completionHandler: { (local, erro) in
                
                if erro == nil {
                    
                    if let dadosLocal = local?.first {
                        if let nome = dadosLocal.name {
                            localCompleto = nome
                        }else{
                            if let endereco = dadosLocal.thoroughfare {
                                localCompleto = endereco
                            }
                        }
                    }
                    
                    //Salvar dados no dispositivo
                    self.viagem = ["local": localCompleto, "latitude": String(coordenadas.latitude), "longitude": String(coordenadas.longitude)]
                    ArmazenamentoDados().salvarViagem(viagem: self.viagem)
                    
                    //print( ArmazenamentoDados().listaViagens() )
                    
                    //Exibe notação com os dados de endereço
                    let anotacao = MKPointAnnotation()
                    anotacao.coordinate.latitude = coordenadas.latitude
                    anotacao.coordinate.longitude = coordenadas.longitude
                    anotacao.title = localCompleto
                    //anotacao.subtitle = "Estou aqui"
                    
                    self.mapa.addAnnotation( anotacao )
                    
                }else{
                    print(erro)
                }
                
            })
            
            
        }
        
    }
    
    func configuraGerenciadorLocalizacao(){
        
        gerenciadorLocalizacao.delegate = self
        gerenciadorLocalizacao.desiredAccuracy = kCLLocationAccuracyBest
        
        //Solicitar, autorização, quando o usuário for usar
        gerenciadorLocalizacao.requestWhenInUseAuthorization()
        
        //Atualiza a localização enquanto usuário se move
        gerenciadorLocalizacao.startUpdatingLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        if status != .authorizedWhenInUse {
            
            let alertaController = UIAlertController(title: "Permissão de localização",
                                                     message: "Necessário a permissão de sua localização",
                                                     preferredStyle: .alert)
            
            let acaoConfiguracoes = UIAlertAction(title: "Abrir configurações", style: .default, handler: {(alertaConfiguracoes) in
                
                if let configuracoes = NSURL(string: UIApplicationOpenSettingsURLString){
                    UIApplication.shared.open(configuracoes as URL)
                }
            })
                                                  
            let acaoCancelar = UIAlertAction(title: "Cancelar", style: .default, handler: nil)
            
            alertaController.addAction( acaoConfiguracoes )
            alertaController.addAction( acaoCancelar )
            
            present( alertaController, animated: true, completion: nil)
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

