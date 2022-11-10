//
//  CatsFake.swift
//  CatsTests
//
//  Created by Juan Diego Marin on 10/11/22.
//

import Foundation
@testable import Cats

enum CatsFake {
    static var value: [Cat] {
        [.init(name: "",
               origin: "",
               intelligence: 0,
               image: image
              )]
    }
    
    static var image: image {
        .init(url: "")
    }
}
