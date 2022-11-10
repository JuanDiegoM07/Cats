//
//  Cats.swift
//  Cats
//
//  Created by Wilson David Molina Lozano on 10/11/22.
//

import Foundation


struct Cats: Decodable {
    
    let name: String?
    let origin: String?
    let intelligence: Int?
    let url: image?
    
    init(name: String?, origin: String?, intelligence: Int?, url: image? ) {
        self.name = name
        self.origin = origin
        self.intelligence = intelligence
        self.url = url
    }
    
}


struct image: Decodable {
    let url: String?
    
    init(url: String?) {
        self.url = url
    }
}
