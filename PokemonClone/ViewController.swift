//
//  ViewController.swift
//  PokemonClone
//
//  Created by Jon Moon on 26/08/2018.
//  Copyright © 2018 Jon Moon. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    var manager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        mapView.showsUserLocation = true
        
        
    }

   
}

