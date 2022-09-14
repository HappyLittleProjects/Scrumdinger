//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Linda Lau on 9/12/22.
//

import SwiftUI

struct DetailEditView: View{
    @Binding var data: DailyScrum.Data
    @State private var newAttendeeName = ""
    
    var body: some View{
        // form container automatically adapts the appearance of controls when it renders on different platforms
        Form{
            Section(header: Text("Meeting Info")) {
                TextField("Title", text: $data.title)
                HStack{
                    // slider stores a double from a specified continuous range
                    Slider(value: $data.lengthInMinutes, in: 5...30, step: 1){
                        Text("Length")
                    }
                    .accessibilityValue("\(Int(data.lengthInMinutes)) minutes")
                    Spacer()
                    Text("\(Int(data.lengthInMinutes)) minutes")
                        .accessibilityHidden(true)
                }
                ThemePicker(selection: $data.theme)
                // theme picker passes changes to the theme selection back to the data.theme property in the edit view
            }
            Section(header: Text("Attendees")){
                ForEach(data.attendees){ attendee in
                    Text(attendee.name)
                }
                // modifier that removes elements from data
                    // called when user swipes to delete row
                .onDelete { indices in
                    data.attendees.remove(atOffsets: indices)
                }
                HStack{
                    TextField("New Attendee", text: $newAttendeeName)
                    Button(action: {
                        withAnimation {
                            let attendee = DailyScrum.Attendee(name: newAttendeeName)
                            data.attendees.append(attendee)
                            newAttendeeName = ""
                        }
                    }){
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add attendee")
                    }
                    .disabled(newAttendeeName.isEmpty)
                }
            }
        }
    }
}

struct DetailEditView_Previews: PreviewProvider{
    static var previews: some View{
        DetailEditView(data: .constant(DailyScrum.sampleData[0].data))
    }
}
