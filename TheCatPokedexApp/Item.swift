//
//  Item.swift
//  TheCatPokedexApp
//
//  Created by Diego Monteagudo Diaz on 3/02/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
