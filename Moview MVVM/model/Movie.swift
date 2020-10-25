//
//  Movie.swift
//  Moview MVVM
//
//  Created by hosam on 10/25/20.
//

import UIKit

struct MovieResponse: Codable {
    let movies: [Movie]
       let totalResults, response: String

       enum CodingKeys: String, CodingKey {
           case movies = "Search"
           case totalResults
           case response = "Response"
       }
   
}

struct Movie:Codable {
   
    
    let title,year,imdbId,poster:String
    
   private enum CodingKeys:String,CodingKey {
    case title = "Title"
    case year = "Year"
    case imdbId = "imdbID"
    case poster = "Poster"
    }
    
}
