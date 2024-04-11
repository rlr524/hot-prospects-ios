//
//  TabViewTest.swift
//  HotProspects
//
//  Created by Rob Ranf on 4/10/24.
//

import SwiftUI

struct TabViewTest: View {
    @State private var selectedTab = "Two"
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Image(.madiOne)
                .resizable()
                .scaledToFit()
                .tabItem {
                    Label("One", systemImage: "star")
                }
                .tag("One")
            
            Image(.madiSp)
                .resizable()
                .scaledToFit()
                .tabItem {
                    Label("Two", systemImage: "circle")
                }
                .tag("Two")
        }
    }
}

#Preview {
    TabViewTest()
}
