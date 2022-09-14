//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Linda Lau on 9/12/22.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData

    var body: some Scene {
        WindowGroup {
            // NavigationView displays navigation elements, such as title/bar/buttons on the canvas
            NavigationView {
                ScrumsView(scrums: $scrums)
            }
        }
    }
}
