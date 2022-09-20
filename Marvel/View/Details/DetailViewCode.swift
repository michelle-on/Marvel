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
    let backgroundDetails = UIView(frame: UIScreen.main.bounds)
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
        
    }
    
    func configConstraints() {
        
    }
    
    
    
}
