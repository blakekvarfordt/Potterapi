//
//  BTKCharacterTableViewController.swift
//  PotterAPI
//
//  Created by Blake kvarfordt on 8/22/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

import UIKit

class BTKCharacterTableViewController: UITableViewController {

    
    var characters: [BTKCharacter]? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        BTKCharacterController.fetchCharacters { (characters) in
            
            guard let characters = characters else { return }
            
            self.characters = characters
            
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let characters = characters else { return 0 }
        
        return characters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath)

        guard let characters = self.characters else { return UITableViewCell()}
       
        let character = characters[indexPath.row]
        
        cell.textLabel?.text = character.name

        return cell
    }
    

    
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        if segue.identifier == "toDetailVC" {
            guard let index = tableView.indexPathForSelectedRow, let destination = segue.destination as? BTKDetailViewController else { return }
            guard let charactersToSend = characters else { return }
            
            destination.character = charactersToSend[index.row]
            
            
        }
    }
    

}
