//
//  Thumbnail.swift
//  Marvel
//
//  Created by Michelle Onasanya on 19/09/22.
//

import Foundation

struct Thumbnail: Codable {
    let path: String?
    let `extension`: String?
    
    init(path: String, extension: String){
        self.path = path
        self.`extension` = `extension`
    }
}
