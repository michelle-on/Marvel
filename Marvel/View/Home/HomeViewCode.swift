//
//  TableViewViewCode.swift
//  Marvel
//
//  Created by Michelle Onasanya on 14/09/22.
//

import Foundation
import UIKit

class HomeViewCode: UIView {
    
    //MARK: - Atributo
    let backgroundHome = UIView(frame: UIScreen.main.bounds)
    let tableViewView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configHierarchy()
         configConstraints()
         print("config homeview on")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configHierarchy() {
        addSubview(backgroundHome)
        self.backgroundHome.addSubview(tableViewView)
        
        self.backgroundHome.translatesAutoresizingMaskIntoConstraints = false
        self.tableViewView.translatesAutoresizingMaskIntoConstraints = false
        self.translatesAutoresizingMaskIntoConstraints = false

        self.tableViewView.backgroundColor = UIColor.black
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            self.backgroundHome.topAnchor.constraint(equalTo: self.topAnchor),
            self.backgroundHome.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.backgroundHome.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.backgroundHome.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.tableViewView.topAnchor.constraint(equalTo: self.backgroundHome.topAnchor),
            self.tableViewView.leadingAnchor.constraint(equalTo: self.backgroundHome.leadingAnchor),
            self.tableViewView.trailingAnchor.constraint(equalTo: self.backgroundHome.trailingAnchor),
            self.tableViewView.bottomAnchor.constraint(equalTo: self.backgroundHome.bottomAnchor)
        ])
    }
    
}
