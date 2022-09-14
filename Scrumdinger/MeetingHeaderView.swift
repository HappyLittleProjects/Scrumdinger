//
//  MeetingHeaderView.swift
//  Scrumdinger
//
//  Created by Linda Lau on 9/13/22.
//

import SwiftUI

struct MeetingHeaderView: View{
    let secondsElapsed: Int
    let secondsRemaining: Int
    let theme: Theme
    
    private var totalSeconds: Int {
        secondsElapsed + secondsRemaining
    }
    private var progress: Double{
        guard totalSeconds > 0 else { return 1 }
        return Double(secondsElapsed) / Double(totalSeconds)
    }
    private var minutesRemaining: Int{
        secondsRemaining / 60
    }
    
    var body: some View{
        VStack{
            ProgressView(value: 5, total: 15)
                .progressViewStyle(ScrumProgressViewStyle(theme: theme))
            // HStack: components/structures embedded will be displayed as a horizontal stack
            HStack{
                // default alignment is center
                VStack(alignment: .leading){
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("\(secondsElapsed)", systemImage: "hourglass.bottomhalf.fill")
                    // system treats SF symbols like fonts, therefore image will scale dynamically
                }
                Spacer()    // add space (duh)
                VStack(alignment: .trailing){
                    Text("Seconds Remaining")
                        // modifier reduces the size of the text to that of captions
                        .font(.caption)
                    Label("\(secondsRemaining)", systemImage: "hourglass.tophalf.fill")
                        .labelStyle(.trailingIcon)
                }
            }
        }
        // modifiers are used to customize
        // VoiceOver accessibility modifiers
            // this is because VoiceOver will read the system image names
        .accessibilityElement(children: .ignore)    // ignores inferred accessibility labels
        .accessibilityLabel("Time remaining")       // a more understandable name that replaces the inferred
        .accessibilityValue("\(minutesRemaining) minutes")           // the values were ignored, so readd them
        .padding([.top, .horizontal])
    }
}

struct MeetingHeaderView_Previews: PreviewProvider{
    static var previews: some View{
        MeetingHeaderView(secondsElapsed: 60, secondsRemaining: 100, theme: .bubblegum)
            .previewLayout(.sizeThatFits)
    }
}
