//
//  CustomLoadingView.swift
//  TheCatPokedexApp
//
//  Created by Diego Monteagudo Diaz on 3/02/25.
//

import SwiftUI

struct CustomLoadingView: View {
    @State var isAnimating: Bool = false
    @State var border = true
    @State var backgroundColor = Color.white

    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(backgroundColor)
            .stroke(Color.black, lineWidth: border ? 2 : 0)
            .overlay {
                Image("paw")
                    .resizable()
                    .frame(width: 45, height: 45)
                    .scaleEffect(isAnimating ? 1.2 : 1.0)
                    .opacity(isAnimating ? 0.6 : 1.0)
                    .animation(
                        Animation.easeInOut(duration: 0.8)
                            .repeatForever(autoreverses: true),
                        value: isAnimating
                    )
            }
            .onAppear {
                isAnimating = true
            }
    }
}

#Preview {
    CustomLoadingView()
}
