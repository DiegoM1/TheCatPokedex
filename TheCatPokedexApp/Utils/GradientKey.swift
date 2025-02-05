//
//  GradientKey.swift
//  TheCatPokedexApp
//
//  Created by Diego Monteagudo Diaz on 3/02/25.
//

import SwiftUI

private struct GradientKey: EnvironmentKey {
    static let defaultValue: LinearGradient = LinearGradient(
        gradient: Gradient(colors: [Color.white, Color.brown.opacity(0.8)]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}

extension EnvironmentValues {
    var appGradient: LinearGradient {
        get { self[GradientKey.self] }
        set { self[GradientKey.self] = newValue }
    }
}
