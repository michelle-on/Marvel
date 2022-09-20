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
            self.backgroundViewCell.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            self.backgroundViewCell.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 10),
            self.backgroundViewCell.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 10),
            
            self.characterImage.topAnchor.constraint(equalTo: self.backgroundViewCell.topAnchor),
            self.characterImage.leadingAnchor.constraint(equalTo: self.backgroundViewCell.leadingAnchor, constant: -15),
            self.characterImage.trailingAnchor.constraint(equalTo: self.nameLabel.leadingAnchor, constant: -15),
            self.characterImage.bottomAnchor.constraint(equalTo: self.backgroundViewCell.bottomAnchor),
            
            self.nameLabel.topAnchor.constraint(equalTo: self.characterImage.topAnchor),
            self.nameLabel.trailingAnchor.constraint(equalTo: self.backgroundViewCell.trailingAnchor)
        ])
    }
    
//    func load(url: URL) {
//        DispatchQueue.global().async {
//            [weak self] in
//            if let data = try? Data(contentsOf: url) {
//                if let image = UIImage(data: data) {
//                    self?.characterImage = UIImageView(image: image)
//                }
//            }
//        }
//    }
    
    func configcell (_ character: Character) {
        nameLabel.text = character.name
//        self.characterImage.image = UIImage(named: "spider-man")

//        guard let path = character.thumbnail?.path else {return}
//
//        guard let url = URL(string: path) else {return}
//
//        URLSession.shared.dataTask(with: url) {data, response, error in
//            guard let data = data, error == nil else {return}
//
//            DispatchQueue.main.async {
//                print("image set")
//                self.characterImage.image = UIImage(data: data)
//            }
    }
}


