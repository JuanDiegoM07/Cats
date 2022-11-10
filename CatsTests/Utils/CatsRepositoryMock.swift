//
//  CatsRepositoryMock.swift
//  CatsTests
//
//  Created by Juan Diego Marin on 10/11/22.
//

import Foundation
@testable import Cats

class CatsRepositoryMock: ApiCatsProtocol {
    
    var cat: [Cat]?
    func getCats(completionHandler: @escaping (Result<[Cat], Error>) -> Void) {
        if let cats = cat {
            completionHandler(.success(cats))
        }
    }
    
}

