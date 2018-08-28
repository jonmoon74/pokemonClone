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
    var zoomer = 350
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        manager.delegate = self
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            print ("Ready to go")
            mapView.showsUserLocation = true
            manager.startUpdatingLocation()
            
            Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: { (timer) in
                //spawn a pokemon
                if let coord = self.manager.location?.coordinate {
                    let anno = MKPointAnnotation()
                    anno.coordinate = coord
                    let randoLat = (Double(arc4random_uniform(200)) - 100) / 50000.0
                    let randoLon = (Double(arc4random_uniform(200)) - 100) / 50000.0
                    anno.coordinate.latitude += randoLat
                    anno.coordinate.longitude += randoLon
                    self.mapView.addAnnotation(anno)
                }
            })
        } else {
            manager.requestWhenInUseAuthorization()
        }
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if updateCount < 5 {
            let region = MKCoordinateRegionMakeWithDistance(manager.location!.coordinate, CLLocationDistance(zoomer), CLLocationDistance(zoomer))
            mapView.setRegion(region, animated: false)
            updateCount += 1
        } else {
            manager.stopUpdatingLocation()
        }
    }
    @IBAction func centreTapped(_ sender: Any) {
        if let coord = manager.location?.coordinate {
            let region = MKCoordinateRegionMakeWithDistance(coord, CLLocationDistance(zoomer), CLLocationDistance(zoomer))
            mapView.setRegion(region, animated: true)
        }
    }
}

