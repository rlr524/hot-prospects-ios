//
//  HotProspectsApp.swift
//  HotProspects
//
//  Created by Rob Ranf on 4/10/24.
//

import SwiftUI
import SwiftData

@main
struct HotProspectsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Prospect.self)
    }
}
