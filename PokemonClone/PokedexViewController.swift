//
//  PokedexViewController.swift
//  PokemonClone
//
//  Created by Jon Moon on 30/08/2018.
//  Copyright © 2018 Jon Moon. All rights reserved.
//

import UIKit

class PokedexViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func mapTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
