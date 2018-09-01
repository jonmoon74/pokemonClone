//
//  PokeAnnotation.swift
//  PokemonClone
//
//  Created by Jon Moon on 01/09/2018.
//  Copyright © 2018 Jon Moon. All rights reserved.
//

import UIKit
import MapKit

class PokeAnnotation : NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var pokemon : Pokemon
    
    init(coord : CLLocationCoordinate2D, pokemon : Pokemon) {
        self.coordinate = coord
        self.pokemon = pokemon
    }
}
