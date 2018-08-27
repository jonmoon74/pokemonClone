//
//  ViewController.swift
//  PokemonClone
//
//  Created by Jon Moon on 26/08/2018.
//  Copyright © 2018 Jon Moon. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var manager = CLLocationManager()
    var updateCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        manager.delegate = self
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            print ("Ready to go")
            mapView.showsUserLocation = true
            manager.startUpdatingLocation()
            
        } else {
            manager.requestWhenInUseAuthorization()
        }
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if updateCount < 5 {
            let region = MKCoordinateRegionMakeWithDistance(manager.location!.coordinate, 500, 500)
            mapView.setRegion(region, animated: false)
            updateCount += 1
        }
    }
}

