//
//  ThemePicker.swift
//  Scrumdinger
//
//  Created by Linda Lau on 9/12/22.
//

import SwiftUI

struct ThemePicker: View{
    // communicates changes to the theme within the theme picker back to the parent view
    @Binding var selection: Theme
    
    var body: some View{
        // will display all available themes
        Picker("Theme", selection: $selection){
            ForEach(Theme.allCases) { theme in
                ThemeView(theme: theme)
                    // you can tag subviews when need to differentiate among them in controls
                        // tag values can be any hashable type like an enumeration
                    .tag(theme)
            }
        }
    }
}

struct ThemePicker_Previewer: PreviewProvider{
    static var previews: some View{
        // use the constant(_:) type method to create a binding to a hardcoded, immutable value
            // useful in previews or when prototyping your app's UI
        ThemePicker(selection: .constant(.periwinkle))
    }
}
