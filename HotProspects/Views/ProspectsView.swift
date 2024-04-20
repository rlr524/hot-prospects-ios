//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Rob Ranf on 4/11/24.
//

import SwiftUI
import SwiftData

struct ProspectsView: View {
    @Query(sort: \Prospect.name) var prospects: [Prospect]
    @Environment(\.modelContext) var mc
        
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
    
    init(filter: FilterType) {
        self.filter = filter
        
        if filter != .none {
            // Assigning the result of filter == .contacted (a bool) to showContactOnly
            let showContactOnly = filter == .contacted
            
            // Here, we're creating a new @Query wrapper, _prospects refers to the
            // @Query property wrapper instance itself, not the value(s) inside prospects.
            _prospects = Query(filter: #Predicate {
                $0.isContacted == showContactOnly
            }, sort: [SortDescriptor(\Prospect.name)])
        }
    }
    
    
    var body: some View {
        NavigationStack {
            List(prospects) { prospect in
                VStack(alignment: .leading) {
                    Text(prospect.name)
                        .font(.headline)
                    Text(prospect.emailAddress)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
}

#Preview {
    ProspectsView(filter: .none)
        .modelContainer(for: Prospect.self)
}
