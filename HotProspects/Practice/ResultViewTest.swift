//
//  ResultViewTest.swift
//  HotProspects
//
//  Created by Rob Ranf on 4/10/24.
//

import SwiftUI

struct ResultViewTest: View {
    @State private var output = ""
    
    var body: some View {
        Text(output)
            .task {
                let result = await fetchReadings()
                
                switch result {
                case .success(let str):
                    output = str
                case.failure(let error):
                    output = "Error: \(error.localizedDescription)"
                }
            }
    }
    
    func fetchReadings() async -> Result<String, Error> {
        let fetchTask = Task {
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            return "Found \(readings.count) readings"
        }
        
        let result = await fetchTask.result
        return result
    }
}

#Preview {
    ResultViewTest()
}
