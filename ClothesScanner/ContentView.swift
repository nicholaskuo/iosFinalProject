//
//  ContentView.swift
//  ClothesScanner
//
//  Created by Nicholas Kuo on 4/13/24.
//

import SwiftUI
import UIKit
import Vision

struct ContentView: View {
    @State private var image: UIImage?
    @State private var showCamera = false
    
    var body: some View {
            VStack {
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                }

                Button("Take Picture") {
                    showCamera = true
                }
            }
            .sheet(isPresented: $showCamera) {
                CameraView(image: $image)
            }
    }
}

#Preview {
    ContentView()
}
