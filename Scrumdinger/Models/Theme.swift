//
//  Theme.swift
//  Scrumdinger
//
//  Created by Linda Lau on 9/12/22.
//

import SwiftUI

// an enumeration of type String
enum Theme: String, CaseIterable, Identifiable, Codable{
    // based in the asset catalog
    // named colors in the asset catalog must match their references in code
    case bubblegum
    case buttercup
    case indigo
    case lavender
    case magenta
    case navy
    case orange
    case oxblood
    case periwinkle
    case poppy
    case purple
    case seafoam
    case sky
    case tan
    case teal
    case yellow
    
    var accentColor: Color{
        switch self {
            case .bubblegum, .buttercup, .lavender, .orange, .periwinkle, .poppy, .seafoam, .sky, .tan, .teal, .yellow: return .black
            case .indigo, .magenta, .navy, .oxblood, .purple: return .white
        }
    }
    
    var mainColor: Color{
        Color(rawValue)
    }
    
    var name: String{
        rawValue.capitalized
    }
    
    var id: String{
        name
    }
}
