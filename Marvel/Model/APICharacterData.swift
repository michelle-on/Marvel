//
//  APICharacterData.swift
//  Marvel
//
//  Created by Michelle Onasanya on 19/09/22.
//

import Foundation

struct APICharacterData: Codable {
    var results: [Character]
    
    init(results: [Character]){
        self.results = results
    }
}
