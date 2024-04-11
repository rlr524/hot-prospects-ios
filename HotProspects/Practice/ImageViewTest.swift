//
//  ImageViewTest.swift
//  HotProspects
//
//  Created by Rob Ranf on 4/10/24.
//

import SwiftUI

struct ImageViewTest: View {
    var body: some View {
        Image(.example)
            .interpolation(.none)
            .resizable()
            .scaledToFit()
            .background(.black)
    }
}

#Preview {
    ImageViewTest()
}
