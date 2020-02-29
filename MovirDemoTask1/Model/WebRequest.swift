//
//  WebRequest.swift
//  MovirDemoTask1
//
//  Created by damir hodez on 02/02/2020.
//  Copyright © 2020 damir hodez. All rights reserved.
//

import Foundation

class WebRequest {
    
    static let shared = WebRequest()
    
    private init() {}
    
    let url = "https://api.myjson.com/bins/biuau"
    
    func fetchData(completion: @escaping ([Movie]) -> Void) {
        let urlRequest = URL(string: url)!
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("error in fetching data: \(error)")
                return
            }
            guard let safeData = data else {
                print("something wrong with the url")
                return
            }
            let decoder = JSONDecoder()
            do {
                let movies = try decoder.decode(Movies.self, from: safeData)
                DispatchQueue.main.async {
                    completion(movies.movies)
                }
            } catch {
                print("there was a problem decoding the data: \(error)")
            }
        }.resume()
    }
    
    func fetchImage(movie: Movie, completion: @escaping (Data) -> Void) {
        let imageURL = URL(string: movie.image)!
        
        URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
            if let error = error {
                print("problem with image URL: \(error)")
                return
            }
            
            guard let safeData = data else {
                print("data not safe: \(error.debugDescription)")
                return
            }
            DispatchQueue.main.async {
                completion(safeData)
            }
        }.resume()
    }
    
    
}
