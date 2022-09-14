//
//  ViewController.swift
//  Marvel
//
//  Created by Michelle Onasanya on 14/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Atributos
    let tableView = UITableView()
    
    var charactersList: Array<Character> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTableViewCode()
    }
    
    func configTableViewCode() {
        tableView.register(CharactersCellViewCode.self, forCellReuseIdentifier: "CharactersCellViewCode")
        
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charactersList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellCharacter = tableView.dequeueReusableCell(withIdentifier: "CharactersCell") as? CharactersCellViewCode else {
            fatalError("Erro ao contruir CharactesCell")
        }
        
        //chamar funcao para celula
        
        return cellCharacter
    }
    
    
}

