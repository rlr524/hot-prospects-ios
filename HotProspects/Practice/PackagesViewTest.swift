//
//  ContentView.swift
//  HotProspects
//
//  Created by Rob Ranf on 4/11/24.
//

import SwiftUI
import SamplePackage

struct PackagesViewTest: View {
    let possibleNumbers = 1...60
    
    var results: String {
        let selected = possibleNumbers.random(7).sorted()
        let strings = selected.map(String.init)
        
        return strings.formatted()
    }
    
    var body: some View {
        Text(results)
    }
}

#Preview {
    PackagesViewTest()
}
