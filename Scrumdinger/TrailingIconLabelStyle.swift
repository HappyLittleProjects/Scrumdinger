//
//  TrailingIconLabelStyle.swift
//  Scrumdinger
//
//  Created by Linda Lau on 9/12/22.
//

import SwiftUI

struct TrailingIconLabelStyle: LabelStyle{
    // configuration is a LabelStyle configuration containing the icon and title views
    func makeBody(configuration: Configuration) -> some View{
        HStack{
            configuration.title
            configuration.icon
        }
    }
}

extension LabelStyle where Self == TrailingIconLabelStyle{
    static var trailingIcon: Self { Self() }
}
