//
//  MovieListViewModel.swift
//  Moview MVVM
//
//  Created by hosam on 10/25/20.
//

import Foundation

class MovieListViewModel:ViewModelBase {
    
    @Published var movies = [MovieViewModel]()
    let httpClient = HTTPClient()
    
    func searchByName(_ name: String) {
        
        if name.isEmpty {
            return
        }
        
        self.loadingState = .loading
        
        httpClient.getMoviesBy(search: name.trimmedAndEscaped()) { result in
            switch result {
            case .success(let movies):
                if let movies = movies {
                    DispatchQueue.main.async {
                        self.movies = movies.map(MovieViewModel.init)
                        self.loadingState = .success
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.loadingState = .failed
                }
            }
        }
    }
    
    
}

struct MovieViewModel {
    
    let movie:Movie
    
    var imdId:String {
        movie.imdbId
    }
    
    var title:String {
        movie.title
    }
    
    var year:String {
        movie.year
    }
    
    var poster:String {
        movie.poster
    }
    
}
