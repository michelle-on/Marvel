//
//  HomeHeader.swift
//  Marvel
//
//  Created by Michelle Onasanya on 10/10/22.
//

import Foundation
import UIKit

class HomeHeader: UIView {
    
    //MARK: - Atributos
    let backgroundHeader = UIView()
    let imageMarvel = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configHierarchy()
        configConstraints()
        imageMarvel.image = UIImage(named: "Header-home")

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configConstraints() {
        addSubview(backgroundHeader)
        
        self.backgroundHeader.addSubview(imageMarvel)
        
        self.backgroundHeader.translatesAutoresizingMaskIntoConstraints = false
        self.imageMarvel.translatesAutoresizingMaskIntoConstraints =  false
    }
    
    func configHierarchy() {
        NSLayoutConstraint.activate([
            self.backgroundHeader.topAnchor.constraint(equalTo: self.topAnchor),
            self.backgroundHeader.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.backgroundHeader.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.backgroundHeader.heightAnchor.constraint(equalToConstant: 150),
            
            self.imageMarvel.topAnchor.constraint(equalTo: self.backgroundHeader.topAnchor),
            self.imageMarvel.leadingAnchor.constraint(equalTo: self.backgroundHeader.leadingAnchor),
            self.imageMarvel.trailingAnchor.constraint(equalTo: self.backgroundHeader.trailingAnchor),
            self.imageMarvel.bottomAnchor.constraint(equalTo: self.backgroundHeader.bottomAnchor)
        ])
    }
}
