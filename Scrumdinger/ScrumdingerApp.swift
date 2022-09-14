//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Linda Lau on 9/12/22.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @StateObject private var store = ScrumStore()

    var body: some Scene {
        WindowGroup {
            // NavigationView displays navigation elements, such as title/bar/buttons on the canvas
            NavigationView {
                ScrumsView(scrums: $store.scrums){
                    ScrumStore.save(scrums: store.scrums){ result in
                        if case .failure(let error) = result {
                            fatalError(error.localizedDescription)
                        }
                    }
                }
            }
            .onAppear{
                ScrumStore.load{ result in
                    switch result{
                    case .failure(let error):
                        fatalError(error.localizedDescription)
                    case .success(let scrums):
                        store.scrums = scrums
                    }
                }
            }
        }
    }
}
