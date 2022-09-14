//
//  MeetingFooterView.swift
//  Scrumdinger
//
//  Created by Linda Lau on 9/13/22.
//

import SwiftUI

struct MeetingFooterView: View{
    let speakers: [ScrumTimer.Speaker]
    // to allow users to skip to the next speaker
    var skipAction: ()->Void
    
    private var speakerNumber: Int? {
        guard let index = speakers.firstIndex(where: { !$0.isCompleted }) else { return nil }
        return index + 1
    }
    
    // property is true if the isCompleted property of each speaker except the last speaker is true
        // same result with reduce(_:_:) by returning speakers.dropLast().reduce(true){ $0 && $1.isCompleted }
    private var isLastSpeaker: Bool {
        return speakers.dropLast().allSatisfy { $0.isCompleted }
    }
    
    // returns Speaker X of Y when there are remaining speakers or No more speakers when the meeting exceeds the allotted time
    private var speakerText: String {
        guard let speakerNumber = speakerNumber else { return "No more speakers" }
        return "Speaker \(speakerNumber) of \(speakers.count)"
    }
    
    var body: some View{
        VStack {
            HStack{
                if isLastSpeaker {
                    Text("Last Speaker")
                }
                else {
                    Text(speakerText)
                    Spacer()
                    Button(action: skipAction){
                        Image(systemName: "forward.fill")
                    }
                    .accessibilityLabel("Next speaker")
                }
            }
        }
        .padding([.bottom, .horizontal])
    }
}

struct MeetingFooterView_Previewers: PreviewProvider{
    static var previews: some View{
        MeetingFooterView(speakers: DailyScrum.sampleData[0].attendees.speakers, skipAction: {})
            .previewLayout(.sizeThatFits)
    }
}
