//
//  StarRatingView.swift
//  TheCatPokedexApp
//
//  Created by Diego Monteagudo Diaz on 3/02/25.
//

import SwiftUI

/// Rating view using stars.
struct StarRatingView: View {
    let rating: Double

    var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<5) { index in
                if rating >= Double(index) + 1 {
                    Image(systemName: "star.fill")
                        .foregroundColor(.indigo)
                } else if rating >= Double(index) + 0.5 {
                    Image(systemName: "star.leadinghalf.filled")
                        .foregroundColor(.indigo)
                } else {
                    Image(systemName: "star")
                        .foregroundColor(.black)
                }
            }
        }
        .font(.footnote)
    }
}

struct StarRatingView_Previews: PreviewProvider {
    static var previews: some View {
        StarRatingView(rating: 5)
    }
}
