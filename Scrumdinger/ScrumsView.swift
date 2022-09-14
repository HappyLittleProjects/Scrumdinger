//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Linda Lau on 9/12/22.
//

import SwiftUI

struct ScrumsView: View{
    @Binding var scrums: [DailyScrum]
    
    // isPresentingNewScrumView property controls the presentation of the edit view to create a new scrum
    @State private var isPresentingNewScrumView = false
    @State private var newScrumData = DailyScrum.Data()
    
    var body: some View{
        List{
            // the $ prefix accesses the projected value of a wrapped property
            ForEach($scrums) { $scrum in
                // destination presents single view navigation hierarchy when user interacts with element
                NavigationLink(destination: DetailView(scrum: $scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
        }
        .navigationTitle("Daily Scrums")
        .toolbar{
            Button(action: {
                isPresentingNewScrumView = true // causes app to present sheet
            }){
                Image(systemName: "plus")
            }
            .accessibilityLabel("New Scrum")
        }
        .sheet(isPresented: $isPresentingNewScrumView){
            NavigationView{
                // takes a binding to newScrumData, but the @State property in ScrumsView maintains the source of truth
                DetailEditView(data: $newScrumData)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction){
                            Button("Dismiss") {
                                isPresentingNewScrumView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Add") {
                                let newScrum = DailyScrum(data: newScrumData)
                                scrums.append(newScrum)
                                isPresentingNewScrumView = false
                                newScrumData = DailyScrum.Data()
                            }
                        }
                }
            }
        }
    }
    
    struct ScrumsView_Previews: PreviewProvider {
        static var previews: some View{
            NavigationView {
                ScrumsView(scrums: .constant(DailyScrum.sampleData))
            }
        }
    }
}
