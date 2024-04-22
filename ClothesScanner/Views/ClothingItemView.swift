//
//  ClothingItemView.swift
//  ClothesScanner
//
//  Created by Riya Setty on 4/18/24.
//

import SwiftUI

struct ClothingItemView: View {
    var body: some View {
        
        VStack {
            Image("tshirt.png")
                .resizable()
                .frame(width: 200, height: 200)
            Spacer().frame(height: 30)
            VStack {
                // kind of arbitrary for now
                Text("Tags: blue, shirt")
                Text("Number of wears: 4")
                Text("other metadata")
            }
            .padding(15)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.black, lineWidth: 1)
            )
        }
    }
}

#Preview {
    ClothingItemView()
}
