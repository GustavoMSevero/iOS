//
//  ViewController.swift
//  UsingGoogleMaps
//
//  Created by Gustavo Severo on 04/05/2018.
//  Copyright © 2018 Gustavo Severo. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        GMSServices.provideAPIKey("AIzaSyCsj9rKrXhF77b8gavu5zxAWWpsv3skbDA")
        
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: -29.993241, longitude: -51.175338, zoom: 10 )
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -29.993241, longitude: -51.175338)
        marker.title = "Aeroporto Internacional Salgado Filho"
        marker.snippet = "Porto Alegre"
        marker.map = mapView
    }



}

