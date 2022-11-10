//
//  Cats.swift
//  Cats
//
//  Created by Wilson David Molina Lozano on 10/11/22.
//

import Foundation


struct Cat: Decodable {
    
    let name: String?
    let origin: String?
    let intelligence: Int?
    let image: image?
    
}


struct image: Decodable {
    let url: String?
    
    init(url: String?) {
        self.url = url
    }
}
