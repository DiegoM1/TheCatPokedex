//
//  LineRatingView.swift
//  TheCatPokedexApp
//
//  Created by Diego Monteagudo Diaz on 4/02/25.
//

import SwiftUI

/// Rating view using lines.
struct LineRatingView: View {
    let rating: Int
    let maxRating: Int = 5
    @State var isAnimating = false

    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(height: 4)

            Rectangle()
                .fill(Color.brown.opacity(0.8))
                .frame(width: isAnimating ? CGFloat(rating) / CGFloat(maxRating) * 200 : 0, height: 4)
                .animation(.easeInOut(duration: 1.5), value: isAnimating)
        }
        .frame(height: 10)
        .overlay(

            Circle()
                .fill(Color.brown)
                .frame(width: 12, height: 12)
                .offset(x:  isAnimating ? CGFloat(rating) / CGFloat(maxRating) * 200 - 6 : 0 )
                .animation(.easeInOut(duration: 1.5), value: isAnimating),
            alignment: .leading
        )
        .onAppear {
            isAnimating = true
        }
    }
}


#Preview {
    LineRatingView(rating: 3)
}
