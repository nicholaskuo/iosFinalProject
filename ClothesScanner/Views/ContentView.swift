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
                        .frame(width: 350, height: 400)
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(style: StrokeStyle(lineWidth: 2, dash: [10]))
                                .foregroundColor(.gray)
                        )
                } else {
                    Text("Scanned clothes appears here")
                                .frame(width: 350, height: 400)
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                                .lineLimit(nil)
                                .padding()
                                .background(Color.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(style: StrokeStyle(lineWidth: 2, dash: [10]))
                                        .foregroundColor(.gray)
                                )
                                .cornerRadius(20)
                }
                
                Button(action: {
                    showCamera = true
                }) {
                    Text("Scan New Clothes")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color(hue: 0.4, saturation: 0.723, brightness: 0.609))
                        .cornerRadius(8)
                }
                .padding()
                
                if let image = image {
                    Button(action: {
                        // TODO: Add Navigation to view where user fills in metadata and saves image (maybe pass the image as a binding into this view)
                    }) {
                        Text("Save Clothing")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color(hue: 0.394, saturation: 0.65, brightness: 0.913))
                            .cornerRadius(8)
                    }
                    .padding()
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
