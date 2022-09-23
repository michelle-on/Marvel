//
//  DetailViewCode.swift
//  Marvel
//
//  Created by Michelle Onasanya on 20/09/22.
//

import Foundation
import UIKit

class DetailsViewCode: UIView {
    
    //MARK: - Atributos
    let backgroundDetails = UIView()
    let imageChatacters = UIImageView()
    let nameLabel = UILabel()
    let descriptionLabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configHierarchy()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configHierarchy() {
        self.addSubview(backgroundDetails)
        
        self.backgroundDetails.addSubview(imageChatacters)
        self.backgroundDetails.addSubview(nameLabel)
        self.backgroundDetails.addSubview(descriptionLabel)
        
        self.imageChatacters.backgroundColor = UIColor.lightGray
        self.backgroundDetails.backgroundColor = UIColor.white
                
        self.backgroundDetails.translatesAutoresizingMaskIntoConstraints = false
        self.imageChatacters.translatesAutoresizingMaskIntoConstraints = false
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.nameLabel.font = UIFont.boldSystemFont(ofSize: 25)
        self.nameLabel.textColor = UIColor.black
        
        self.descriptionLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.descriptionLabel.numberOfLines = 0
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
        
            self.backgroundDetails.topAnchor.constraint(equalTo: self.topAnchor),
            self.backgroundDetails.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.backgroundDetails.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.backgroundDetails.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.imageChatacters.topAnchor.constraint(equalTo: self.backgroundDetails.topAnchor),
            self.imageChatacters.leadingAnchor.constraint(equalTo: self.backgroundDetails.leadingAnchor),
            self.imageChatacters.trailingAnchor.constraint(equalTo: self.backgroundDetails.trailingAnchor),
            self.imageChatacters.heightAnchor.constraint(equalToConstant: 300),
            
            self.nameLabel.topAnchor.constraint(equalTo: self.imageChatacters.bottomAnchor, constant: 5),
            self.nameLabel.leadingAnchor.constraint(equalTo: self.backgroundDetails.leadingAnchor, constant: 5),
            self.nameLabel.trailingAnchor.constraint(equalTo: self.backgroundDetails.trailingAnchor),
            self.nameLabel.bottomAnchor.constraint(equalTo: self.descriptionLabel.topAnchor, constant: -15),
            
            self.descriptionLabel.leadingAnchor.constraint(equalTo: self.backgroundDetails.leadingAnchor, constant: 5),
            self.descriptionLabel.trailingAnchor.constraint(equalTo: self.backgroundDetails.trailingAnchor, constant: -5)
        ])
    }
    
    func configDetails (_ character: Character) {
        nameLabel.text = character.name
        descriptionLabel.text = character.description
        
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
                    self.imageChatacters.image = UIImage(data: data)
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
