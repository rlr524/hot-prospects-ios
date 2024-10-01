//
//  EditingView.swift
//  HotProspects
//
//  Created by Rob Ranf on 9/30/24.
//

import SwiftUI
import SwiftData

struct EditingView: View {
    @Bindable var prospect: Prospect

    var body: some View {
        Form {
            TextField("Name", text: $prospect.name)
            TextField("Email Address", text: $prospect.emailAddress)
            Toggle("Contacted", isOn: $prospect.isContacted)
        }
        .navigationTitle("Edit Prospect")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
}
