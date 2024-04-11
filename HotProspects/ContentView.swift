//
//  ContentView.swift
//  HotProspects
//
//  Created by Rob Ranf on 4/10/24.
//

import SwiftUI

struct ContentView: View {
    let users = ["Tohru", "Yuki", "Kyo", "Yui", "Megumin"]
    @State private var selection = Set<String>()
    @State private var selectedTab = "One"
    
    var body: some View {
        List(users, id: \.self, selection: $selection) { user in
            Text(user)
        }
        
        EditButton()
        
        if selection.isEmpty == false {
            Text("You selected \(selection.formatted())")
        }
    }
}

#Preview {
    ContentView()
}
