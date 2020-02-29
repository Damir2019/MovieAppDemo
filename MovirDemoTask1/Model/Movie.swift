//
//  Movie.swift
//  MovirDemoTask1
//
//  Created by damir hodez on 02/02/2020.
//  Copyright © 2020 damir hodez. All rights reserved.
//

import Foundation

struct Movies: Decodable {
    let movies: [Movie]
}

struct Movie: Decodable {
    let id: String
    let title: String
    let image: String
    let rating: String
    let releaseYear: String
    let genre: [String]
    
    func allGenres() -> String {
        var genreDescription: String = ""
        for eachGenre in genre {
            genreDescription.append(eachGenre)
            if eachGenre != genre.last {
                genreDescription.append(", ")
            }
        }
        return genreDescription
    }
    
}
