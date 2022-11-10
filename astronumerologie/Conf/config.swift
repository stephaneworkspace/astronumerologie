//
// Created by Stéphane on 03.09.22.
//

import Foundation
import SwiftUI

// Language
var F: Int = 0
var E: Int = 1

// Default font
var FONTSIZE: CGFloat = 16
var FONTSYSTEM: Font = .system(size: FONTSIZE, weight: .light, design: .default)

var FONTSIZETITLE: CGFloat = 17
var FONTSYSTEMTITLE: Font = .system(size: FONTSIZE, weight: .semibold, design: .default)
var FONTSYSTEMTITLEMEDIUM: Font = .system(size: FONTSIZE, weight: .medium, design: .default)

var FONTSIZESMALL: CGFloat = 14
var FONTSYSTEMSMALL: Font = .system(size: FONTSIZESMALL, weight: .light, design: .default)

// Image Scale
var IMAGESCALE: Image.Scale = .medium
var FOREGROUNDCOLOR: Color = .accentColor

// Formatter
var FORMATTER: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.allowsFloats = true
    return formatter
}()

var FORMATTERWITHOUTFLOAT: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.allowsFloats = false
    return formatter
}()
