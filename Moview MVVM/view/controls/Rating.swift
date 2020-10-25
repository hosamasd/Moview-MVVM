//
//  Rating.swift
//  Moview MVVM
//
//  Created by hosam on 10/25/20.
//


import SwiftUI

struct Rating: View {
    
    @Binding var rating: Int?
    
    private func starType(index: Int) -> String {
        
        return index <= rating ?? 0 ? "star.fill" : "star"
    }
    
    var body: some View {
        HStack {
            ForEach(1...10, id: \.self) { index in
                Image(systemName: self.starType(index: index))
                    .foregroundColor(Color.orange)
                    .onTapGesture {
                        self.rating = index
                }
            }
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        Rating(rating: .constant(3))
    }
}
