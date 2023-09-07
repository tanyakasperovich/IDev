//
//  Color.swift
//  IDev
//
//  Created by Татьяна Касперович on 6.09.23.
//

import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let orangeColor = Color("Orange")
    let purpleColor = Color("Purple")
    let blueColor = Color("Blue")
}


enum SelecledColor: String {
    
    case swift = "Orange"
    case swiftUI = "Purple"
    case uIKit = "Blue"
    case accent = "AccentColor"
}
