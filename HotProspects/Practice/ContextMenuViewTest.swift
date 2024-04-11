//
//  ContextMenuViewTest.swift
//  HotProspects
//
//  Created by Rob Ranf on 4/11/24.
//

import SwiftUI

struct ContextMenuViewTest: View {
    @State private var backgroundColor = Color.red
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Hello, Madison")
                .padding()
                .background(backgroundColor)
            
            Text("Change Color")
                .padding()
                .contextMenu {
                    Button("Red", systemImage: "checkmark.circle.fill") {
                        backgroundColor = .red
                    }
                    .foregroundStyle(.red)
                    
                    Button("Green") {
                        backgroundColor = .green
                    }
                    
                    Button("Blue") {
                        backgroundColor = .blue
                    }
                }
            
            Spacer()
            
            List {
                Text("Taylor Swift")
                    .swipeActions {
                        Button("Delete", systemImage: "minus.circle", role: .destructive) {
                            print("Deleting")
                        }
                    }
                    .swipeActions(edge: .leading) {
                        Button("Pin", systemImage: "pin") {
                            print("Pinning")
                        }
                        .tint(.orange)
                    }
            }
        }
    }
}

#Preview {
    ContextMenuViewTest()
}
