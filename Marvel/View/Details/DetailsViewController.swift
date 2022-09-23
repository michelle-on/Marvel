//
//  DetailsViewController.swift
//  Marvel
//
//  Created by Michelle Onasanya on 20/09/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    //MARK: - Atributos
    let detailView = DetailsViewCode()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(detailView)
        configConstraints()
    }
    
    func configConstraints() {
        self.detailView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.view.topAnchor.constraint(equalTo: self.detailView.topAnchor),
            self.view.leadingAnchor.constraint(equalTo: self.detailView.leadingAnchor),
            self.view.trailingAnchor.constraint(equalTo: self.detailView.trailingAnchor),
            self.view.bottomAnchor.constraint(equalTo: self.detailView.bottomAnchor),
        ])
    }
}

