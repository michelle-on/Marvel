//
//  results.swift
//  Marvel
//
//  Created by Michelle Onasanya on 19/09/22.
//

import Foundation

struct Results: Codable {
    var data: APICharacterData
    
    init(data: APICharacterData){
        self.data = data
        
    }
}
