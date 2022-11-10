//
//  Thread.swift
//  Cats
//
//  Created by Juan Diego Marin on 10/11/22.
//

import Foundation

enum Thread {

    static func main(_ block: @escaping () -> Void?) {
        DispatchQueue.main.async {
            block()
        }
    }
}
