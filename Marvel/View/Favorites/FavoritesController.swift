//
//  FavoriteController.swift
//  Marvel
//
//  Created by Michelle Onasanya on 26/09/22.
//

import Foundation
import UIKit

class FavoritesController: UIViewController {
    
    //MARK: Atributos
    let homeView = HomeViewCode()
    let favorites = Favorites()
    var characterFavoriteList: Array<Character> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(homeView)
        configTableViewCode()
        configConstraints()
        characterFavoriteList = favorites.getListFavorite()
    }
    
    func configConstraints() {
        self.homeView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.view.topAnchor.constraint(equalTo: self.homeView.topAnchor),
            self.view.leadingAnchor.constraint(equalTo: self.homeView.leadingAnchor),
            self.view.trailingAnchor.constraint(equalTo: self.homeView.trailingAnchor),
            self.view.bottomAnchor.constraint(equalTo: self.homeView.bottomAnchor)
        ])
    }
    
    func configTableViewCode() {
        self.homeView.tableViewView.register(CharactersCellViewCode.self, forCellReuseIdentifier: "CharactersCell")

        homeView.tableViewView.dataSource = self
        homeView.tableViewView.delegate = self
    }
}

extension FavoritesController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characterFavoriteList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cellCharacters = tableView.dequeueReusableCell(withIdentifier: "CharactersCell") as? CharactersCellViewCode else { fatalError("Falha ao contruir CharactersCell")
    }
        
        cellCharacters.configcell(characterFavoriteList[indexPath.row])
        return cellCharacters
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsController = DetailsViewController()
        
        guard let navigation = self.navigationController else {
            print("nao foi possivel encontrar o navigation")
            return
        }
        
        detailsController.detailView.configDetails(characterFavoriteList[indexPath.row])
        navigation.pushViewController(detailsController, animated: true)
    }
}
