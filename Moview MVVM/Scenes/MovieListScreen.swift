//
//  MovieListScreen.swift
//  Moview MVVM
//
//  Created by hosam on 10/25/20.
//

import SwiftUI

struct MovieListScreen: View {
    
    @ObservedObject private var movieListVM: MovieListViewModel
    @State private var movieName: String = ""
    
    init() {
        self.movieListVM = MovieListViewModel()
    }
    
    var body: some View {
        VStack {
            
            TextField("Search...", text: $movieName, onEditingChanged: { (changed) in
                self.movieListVM.searchByName(self.movieName)
                       }) {
                self.movieListVM.searchByName(self.movieName)
            }.padding().textFieldStyle(RoundedBorderTextFieldStyle())
                       
            
//            TextField("Search", text: $movieName, .onChange,: {
//                self.movieListVM.searchByName(self.movieName)
//                         }, onCommit: {
//                // perform the search
//                self.movieListVM.searchByName(self.movieName)
//            }).textFieldStyle(RoundedBorderTextFieldStyle())
            Spacer()
            
            .navigationBarTitle("Movies")
            
            if self.movieListVM.loadingState == .success {
                  MovieListView(movies: self.movieListVM.movies)
            } else if self.movieListVM.loadingState == .failed {
                FailedView()
            } else if self.movieListVM.loadingState == .loading {
                LoadingView()
            }
          
           
        }.padding().embedNavigationView()
    }
}

struct MovieListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieListScreen()
    }
}
