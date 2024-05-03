//
//  Globals.swift
//  HotProspects
//
//  Created by Rob Ranf on 5/2/24.
//

import Foundation
import SwiftUI

class K {
    static let environment: String = "development"
}

private struct EnvironmentKeys: EnvironmentKey {
    typealias Value = <#type#>
    
    static let environment: String = "development"
}

extension EnvironmentValues {
    var customValue: String {
        get { self[EnvironmentKeys.self] }
        set { self[EnvironmentKeys.self] = newValue }
    }
    
    extension View {
        func customValue(_ customValue: String) -> some View {
            environment(.\customValue, customValue)
        }
    }
}
