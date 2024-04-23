//
//  HeaderView.swift
//  ClothesScanner
//
//  Created by Madelyn Dempsey on 4/22/24.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        GeometryReader { geometry in
                    ZStack {
                        Color.purple // Background color
                            .frame(height: 80 + geometry.safeAreaInsets.top) // Adjust height to include safe area
                        
                        Text("MyStyle") // App Name
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white) // Text color
                            .padding()
                    }
                    .edgesIgnoringSafeArea(.top) // Ignore safe area insets
                }
    }
}

#Preview {
    HeaderView()
}
