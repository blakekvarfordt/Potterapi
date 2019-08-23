//
//  BTKDetailViewController.swift
//  PotterAPI
//
//  Created by Blake kvarfordt on 8/22/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

import UIKit

class BTKDetailViewController: UIViewController {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var houseLabel: UILabel!
    @IBOutlet weak var nastyBoggartLabel: UILabel!
    @IBOutlet weak var deathEaterLabel: UILabel!
    
    
    var character: BTKCharacter? {
        didSet {
            updateViews()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func updateViews() {
        
        guard let character = character else { return }
        
        DispatchQueue.main.async {
            self.nameLabel.text = character.name
            self.houseLabel.text = character.house
            self.nastyBoggartLabel.text = character.boggart
            self.deathEaterLabel.text = "\(character.deathEater)"
        }
        
    }
 

}
