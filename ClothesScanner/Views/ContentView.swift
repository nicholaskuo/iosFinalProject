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
    @State private var isActive = false 
    
    var body: some View {
        TabView {
            ScannerView()
                .tabItem() {
                    Image(systemName: "camera.fill")
                    Text("Add Items")
                }
            ClosetView()
                .tabItem() {
                    Image(systemName: "tshirt.fill")
                    Text("Closet")
                }
            InfoView()
                .tabItem(){
                    Image(systemName: "info.circle.fill")
                    Text("Help")
                }
        }
    }
}

#Preview {
    ContentView()
}
