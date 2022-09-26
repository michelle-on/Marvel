//
//  ViewController.swift
//  Marvel
//
//  Created by Michelle Onasanya on 14/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Atributos
    let homeView = HomeViewCode()
    let favButton = UIBarButtonItem(image: UIImage(named: "favorite-on"), style: .done, target: ViewController.self, action: #selector(favoritesCharacters))
    
    let url = URL(string: "https://gateway.marvel.com/v1/public/characters")
    
    let timestamp = "0"
    let hashMD5 = "c0fcc0d4e856be344378b728d1e11907"
    let limit = "6"
    let pubKey = "20b9106e8d9c68c1e46b933c23147ff8"
    
    var charactersList: Array<Character> = []

    lazy var queryList = [URLQueryItem(name: "ts", value: timestamp), URLQueryItem(name: "apikey", value: pubKey), URLQueryItem(name: "hash", value: hashMD5)]
    
    //MARK: - Funções

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(homeView)
        self.navigationItem.rightBarButtonItem = favButton
        configTableViewCode()
        configConstraints()
        getCharacters()
    }
    
    @objc func favoritesCharacters() {
        
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
    
    func getCharacters() -> Void {
        guard let marvelUrl = url else {return}
        
        guard var component = URLComponents(url: marvelUrl, resolvingAgainstBaseURL: false) else {return}
        component.queryItems = queryList
        
        guard let componentUrl = component.url else {return}
        
        URLSession.shared.dataTask(with: componentUrl) {(data, response, erro) in
            guard let data = data else {
                print("data nao encontrada")
                return
            }
            
            do {
                let results = try JSONDecoder().decode(Results.self, from: data)
                
                self.charactersList = results.data.results
                
                DispatchQueue.main.async {
                    self.homeView.tableViewView.reloadData()
                }
                
            } catch {
                print(String(describing: erro))
            }
        }.resume()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charactersList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cellCharacter = tableView.dequeueReusableCell(withIdentifier: "CharactersCell") as? CharactersCellViewCode else {
            fatalError("Erro ao contruir CharactesCell")
        }
        
        cellCharacter.configcell(charactersList[indexPath.row])
        return cellCharacter
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsController = DetailsViewController()
        
        guard let navigation = self.navigationController else {
            print("nao foi possivel encontrar o navigation")
            return
        }
        
        detailsController.detailView.configDetails(charactersList[indexPath.row])
        navigation.pushViewController(detailsController, animated: true)
    }
}




