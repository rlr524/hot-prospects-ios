//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Rob Ranf on 4/11/24.
//

import SwiftUI

struct ProspectsView: View {
    enum FilterType {
        case none, contacted, uncontacted
    }
    
    let filter: FilterType
    
    var title: String {
        switch filter {
        case .none: 
            "Everyone"
        case .contacted: 
            "Contacted people"
        case .uncontacted:
            "Uncontacted people"
        }
    }
    
    
    var body: some View {
        NavigationStack {
            Text("Hello World!")
                .navigationTitle(title)
        }
    }
}

#Preview {
    ProspectsView(filter: .none)
}
