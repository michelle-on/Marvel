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
        self.characterImage.backgroundColor = UIColor.gray
        
        self.backgroundViewCell.translatesAutoresizingMaskIntoConstraints = false
        self.characterImage.translatesAutoresizingMaskIntoConstraints = false
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.nameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        self.nameLabel.textColor = UIColor.black
    }
    
    func configConstraints() {
        
        NSLayoutConstraint.activate([
            
            self.backgroundViewCell.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            self.backgroundViewCell.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.backgroundViewCell.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.backgroundViewCell.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -5),
            
            self.characterImage.topAnchor.constraint(equalTo: self.backgroundViewCell.topAnchor, constant: -5),
            self.characterImage.heightAnchor.constraint(equalToConstant: 100),
            self.characterImage.widthAnchor.constraint(equalToConstant: 100),
            self.characterImage.leadingAnchor.constraint(equalTo: self.backgroundViewCell.leadingAnchor),
            self.characterImage.bottomAnchor.constraint(equalTo: self.backgroundViewCell.bottomAnchor),
            
            self.nameLabel.topAnchor.constraint(equalTo: self.characterImage.topAnchor),
            self.nameLabel.leadingAnchor.constraint(equalTo: self.characterImage.trailingAnchor, constant: 5),
            self.nameLabel.trailingAnchor.constraint(equalTo: self.backgroundViewCell.trailingAnchor)
        ])
    }
    
    func configcell (_ character: Character) {
        nameLabel.text = character.name
        self.characterImage.image = UIImage(named: "Image-2")
        
        //baixar a imagem (urlsession), converter o data para imagem (conversor data para uiimage)
    }
}


