//
//  CatsViewModel.swift
//  Cats
//
//  Created by Juan Diego Marin on 10/11/22.
//

import UIKit

class CatsViewModel {
    
    // MARK: - Internal Properties
    var error: (String) -> Void = { _ in }
    var success: () -> Void = { }
    var cats: [Cat] = []
    
    // MARK: - Private Properties
    
    private var repository: ApiCatsProtocol
    
    init(repository: ApiCatsProtocol) {
        self.repository = repository
    }
    
    func getCats() {
        repository.getCats { result in
            switch result {
                
            case .success(let banks):
                self.cats = banks
                self.success()
            case .failure(let error):
                self.error(error.localizedDescription)
            }
        }
    }

}
