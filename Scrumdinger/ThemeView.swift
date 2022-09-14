//
//  ThemeView.swift
//  Scrumdinger
//
//  Created by Linda Lau on 9/12/22.
//

import SwiftUI

struct ThemeView: View{
    let theme: Theme
    
    var body: some View{
        // overlays views back to front, RoundedRectangle appears behind the views listed below it
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .fill(theme.mainColor)
            Label(theme.name, systemImage: "paintpalette")
                .padding(4)
        }
        .foregroundColor(theme.accentColor)
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct ThemeView_Previewer: PreviewProvider{
    static var previews: some View{
        ThemeView(theme: .buttercup)
    }
}
