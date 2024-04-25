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
                        Color.purple
                            .frame(height: 80 + geometry.safeAreaInsets.top)
                        
                        Text("MyStyle")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                    }
                    .edgesIgnoringSafeArea(.top) 
                }
    }
}

#Preview {
    HeaderView()
}
