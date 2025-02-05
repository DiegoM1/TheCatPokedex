//
//  ErrorView.swift
//  TheCatPokedexApp
//
//  Created by Diego Monteagudo Diaz on 4/02/25.
//

import SwiftUI

/// Reusable error view to notify user something wron happened.
struct ErrorView : View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "exclamationmark.triangle")
                .resizable()
                .scaledToFit()
                .foregroundColor(.red)
                .frame(width: 80, height: 80)

            Text("Error")
                .font(.title)
                .fontWeight(.black)
                .foregroundColor(.black)

            Text("An error occurred. Please check if the API key is correct and try again. Pull down to refresh.")
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
        }
        .padding()
        .listRowBackground(Color.clear)
        .cornerRadius(15)
    }
}

