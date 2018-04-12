//
//  ViewController.swift
//  Trabalhando com mapas
//
//  Created by Gustavo Severo on 26/05/17.
//  Copyright © 2017 Gustavo Severo. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapa: MKMapView!
    var gerenciadorLocal = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //A própria classe irá gerenciar
        gerenciadorLocal.delegate = self
        
        //Precisão de localização
        gerenciadorLocal.desiredAccuracy = kCLLocationAccuracyBest
        
        gerenciadorLocal.requestWhenInUseAuthorization()
        gerenciadorLocal.startUpdatingLocation()
        
        
        
        //-23.5866839, -46.6575309
        
        /*
        let latitude: CLLocationDegrees = -23.5866839
        
        let longitude: CLLocationDegrees = -46.6575309
        
        //Define o zoom. Diferença entre uma área e outra
        let deltaLatitude: CLLocationDegrees = 0.01
        let deltaLongitude: CLLocationDegrees = 0.01
        
        let localizacao: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        let areaVisualizacao: MKCoordinateSpan = MKCoordinateSpanMake(deltaLatitude, deltaLongitude)
        
        let regiao: MKCoordinateRegion = MKCoordinateRegionMake(localizacao, areaVisualizacao)
        
        mapa.setRegion(regiao, animated: true)
        
        //Colocando uma anotação
        let anotacao = MKPointAnnotation()
        
        //configurar
        //Colocando as coordenadas
        anotacao.coordinate = localizacao
        anotacao.title = "Parque"
        anotacao.subtitle = "Parque de São Paulo"
        
        mapa.addAnnotation( anotacao )*/
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //print(locations)
        let localizacaoUsuario: CLLocation = locations.last!
        
        //monta a exibição do mapa
        let latitude: CLLocationDegrees = localizacaoUsuario.coordinate.latitude
        let longitude: CLLocationDegrees = localizacaoUsuario.coordinate.longitude
        
        let deltaLatitude: CLLocationDegrees = 0.01
        let deltaLongitude: CLLocationDegrees = 0.01
        
        let localizacao: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        let areaVisualizacao: MKCoordinateSpan = MKCoordinateSpanMake(deltaLatitude, deltaLongitude)
        
        let regiao: MKCoordinateRegion = MKCoordinateRegionMake(localizacao, areaVisualizacao)
        
        mapa.setRegion(regiao, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

