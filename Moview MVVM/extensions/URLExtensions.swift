//
//  URLExtensions.swift
//  Moview MVVM
//
//  Created by hosam on 10/25/20.
//

import UIKit


extension URL {
    
    static func forMoviesByName(_ name: String) -> URL? {
        return URL(string: "http://www.omdbapi.com/?s=\(name)&apikey=\(Constants.API_KEY)".toSecrueHttps())
    }
    
    static func forMoviesByImdbId(_ imdbId: String) -> URL? {
        return URL(string: "http://www.omdbapi.com/?i=\(imdbId)&apikey=\(Constants.API_KEY)".toSecrueHttps())
    }
    
}
