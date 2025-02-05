//
//  WebViewContainer.swift
//  TheCatPokedexApp
//
//  Created by Diego Monteagudo Diaz on 4/02/25.
//

import SwiftUI

struct WebViewContainer: View {
    @State private var isLoading = true
    let url: URL

    var body: some View {
        ZStack {
            WebView(url: url, isLoading: $isLoading)

            if isLoading {
                CustomLoadingView(border: false)
            }
        }
    }
}

#Preview {
    WebViewContainer(url: URL(string: "https://www.google.com")!)
}
