//
//  Character.swift
//  Marvel
//
//  Created by Michelle Onasanya on 14/09/22.
//

import Foundation
import UIKit

struct Character: Codable {
    let id: Int?
    let name: String?
    let thumbnail: Thumbnail?
    let description: String?
    
    init(id: Int, name: String, thumbnail: Thumbnail, description: String) {
        self.id = id
        self.name = name
        self.thumbnail = thumbnail
        self.description = description
    }
}


