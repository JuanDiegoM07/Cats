//
//  ApiCats.swift
//  Cats
//
//  Created by Wilson David Molina Lozano on 10/11/22.
//

import Foundation

protocol ApiCatsProtocol {
    func getCats(completionHandler: @escaping (Result<[Cat], Error>) -> Void)
}


class ApiCats: ApiCatsProtocol {
    
    func getCats(completionHandler: @escaping (Result<[Cat], Error>) -> Void) {
        let url = URL(string: "https://api.thecatapi.com/v1/breeds")!
        var request = URLRequest(url: url)
        request.setValue("bda53789-d59e-46cd-9bc4-2936630fde39", forHTTPHeaderField: "x-api-key")
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            if let error = error {
                DispatchQueue.main.async {
                    completionHandler(.failure(error))
                }
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: \(String(describing: response))")
                return
            }
            
            if let data = data,
               let cats = try? JSONDecoder().decode([Cat].self, from: data) {
                DispatchQueue.main.async {
                  
                    completionHandler(.success(cats))
                }
            }
        })
        task.resume()
    }
}
