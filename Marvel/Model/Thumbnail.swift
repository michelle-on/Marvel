//
//  Thumbnail.swift
//  Marvel
//
//  Created by Michelle Onasanya on 19/09/22.
//

import Foundation

struct Thumbnail: Codable {
    let path: String?
    
    init(path: String){
        self.path = path
    }
}
