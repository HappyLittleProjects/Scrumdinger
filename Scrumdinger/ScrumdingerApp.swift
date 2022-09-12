//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Linda Lau on 9/12/22.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
