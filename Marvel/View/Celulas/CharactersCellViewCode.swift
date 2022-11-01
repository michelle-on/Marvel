//
//  CharactersCellViewCode.swift
//  Marvel
//
//  Created by Michelle Onasanya on 14/09/22.
//

import Foundation
import UIKit

final class CharactersCellViewCode: UITableViewCell {
    
    //MARK: - Atributos
    var network: Network = Implementation()
    
    let backgroundViewCell = UIView()
    var characterImage = UIImageView()
    let nameLabel = UILabel()
    let favoriteButton = UIButton()
    
    var favorites = Favorites()
    var char: Character?
    var charactersList: [Character] = []
    
    var `extension`: String = ""
    var path: String = ""
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configHierarchy()
        configConstraints()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func favorite() {
        guard let character = char else {return}
        charactersList = favorites.getListFavorite()
        
        print(charactersList)
        if favorites.isFavorite(character) == true {
            favorites.remove(character)
            self.favoriteButton.setImage(UIImage(named: "favorite"), for: .normal)

        } else {
            favorites.add(character)
            self.favoriteButton.setImage(UIImage(named: "favorite-on"), for: .normal)
        }
        
        charactersList = favorites.getListFavorite()
        print(charactersList)
}

    func configHierarchy() {
        self.contentView.addSubview(backgroundViewCell)
        
        self.backgroundViewCell.addSubview(characterImage)
        self.backgroundViewCell.addSubview(nameLabel)
        self.backgroundViewCell.addSubview(favoriteButton)
        
        self.backgroundViewCell.backgroundColor = UIColor.white
        self.characterImage.backgroundColor = UIColor.green
        
        self.favoriteButton.setImage(UIImage(named: "favorite"), for: .normal)
        
        self.backgroundViewCell.translatesAutoresizingMaskIntoConstraints = false
        self.characterImage.translatesAutoresizingMaskIntoConstraints = false
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        self.nameLabel.textColor = UIColor.black
        
        favoriteButton.addTarget(self, action: #selector(self.favorite) , for: .touchUpInside)
    }
    
    func configConstraints() {
        
        NSLayoutConstraint.activate([
            
            self.backgroundViewCell.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5),
            self.backgroundViewCell.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.backgroundViewCell.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.backgroundViewCell.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -5),
            
            self.characterImage.topAnchor.constraint(equalTo: self.backgroundViewCell.topAnchor, constant: -5),
            self.characterImage.heightAnchor.constraint(equalToConstant: 150),
            self.characterImage.widthAnchor.constraint(equalToConstant: 150),
            self.characterImage.leadingAnchor.constraint(equalTo: self.backgroundViewCell.leadingAnchor, constant: 5),
            self.characterImage.bottomAnchor.constraint(equalTo: self.backgroundViewCell.bottomAnchor),
            
            self.nameLabel.topAnchor.constraint(equalTo: self.characterImage.topAnchor),
            self.nameLabel.leadingAnchor.constraint(equalTo: self.characterImage.trailingAnchor, constant: 5),
            self.nameLabel.trailingAnchor.constraint(equalTo: self.favoriteButton.leadingAnchor),
            
            self.favoriteButton.topAnchor.constraint(equalTo: self.backgroundViewCell.topAnchor),
            self.favoriteButton.heightAnchor.constraint(equalToConstant: 30),
            self.favoriteButton.widthAnchor.constraint(equalToConstant: 30),
            self.favoriteButton.trailingAnchor.constraint(equalTo: self.backgroundViewCell.trailingAnchor, constant: -10)
        ])
    }
    
    func configcell (_ character: Character) {
        nameLabel.text = character.name
        
        `extension` = character.thumbnail?.extension ?? ""
        path = character.thumbnail?.path ?? ""
        path += ".\(`extension`)"
        guard let urlPath = URL(string: path) else {return}
        
        char = character
        getImageCharacter(urlPath)
    }
    
    func getImageCharacter(_ path: URL) {
        network.dataTask(with: path, callback: { (data, response, erro) in
            guard
                let data = data else {return}
            
            do {
                 try data.write(to: self.getDocumentsDirectory().appendingPathComponent("image.jpg"))
                
                DispatchQueue.main.async {
                    self.characterImage.image = UIImage(data: data)
                }
            } catch {
                print("Erro\(String(describing: erro))")
            }
          })
        }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}


