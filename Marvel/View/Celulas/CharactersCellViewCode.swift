//
//  CharactersCellViewCode.swift
//  Marvel
//
//  Created by Michelle Onasanya on 14/09/22.
//

import Foundation
import UIKit

class CharactersCellViewCode: UITableViewCell {
    
    //MARK: - Atributos
    let backgroundViewCell = UIView()
    var characterImage = UIImageView()
    let nameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configHierarchy()
        configConstraints()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configHierarchy() {
        self.contentView.addSubview(backgroundViewCell)
        
        self.backgroundViewCell.addSubview(characterImage)
        self.backgroundViewCell.addSubview(nameLabel)
        
        self.backgroundViewCell.backgroundColor = UIColor.white
        self.characterImage.backgroundColor = UIColor.green
        
        self.backgroundViewCell.translatesAutoresizingMaskIntoConstraints = false
        self.characterImage.translatesAutoresizingMaskIntoConstraints = false
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        self.nameLabel.textColor = UIColor.black
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
            self.nameLabel.trailingAnchor.constraint(equalTo: self.backgroundViewCell.trailingAnchor)
        ])
    }
    
    func configcell (_ character: Character) {
        nameLabel.text = character.name
        
        guard let `extension` = character.thumbnail?.extension else {return}
        guard var path = character.thumbnail?.path else {return}
        path += ".\(`extension`)"
        guard let urlPath = URL(string: path) else {return}
        
        getImageCharacter(urlPath)
    }
    
    func getImageCharacter(_ path: URL) {
        URLSession.shared.dataTask(with: path ) { data, response, erro in
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

        }.resume()
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}


