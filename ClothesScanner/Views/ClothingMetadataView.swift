//
//  ClothingMetadataView.swift
//  ClothesScanner
//
//  Created by Nicholas Kuo on 4/22/24.
//

import Foundation
import SwiftUI

import UIKit

struct ClothingMetadataView: View {
    @State private var selectedType = "Tops"
    @State private var price = ""
    @State private var color = ""
    @State private var clothingName = ""
    let clothingTypes = ["Tops", "Bottoms", "Sleepwear", "Outerwear", "Shoes", "Accessories", "Miscellaneous"]
    @State private var isActive = false

    var uiImage: UIImage
    
    var body: some View {
        NavigationView {
            VStack{
                Form {
                    Section(header: Text("Clothing")) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 250, height: 300)
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [10]))
                                    .foregroundColor(.gray)
                            )
                    }
                    
                    Section(header: Text("Details")) {
                        Picker("Type", selection: $selectedType) {
                            ForEach(clothingTypes, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        
                        TextField("Name", text: $clothingName)
                        TextField("Color", text: $color)
                        TextField("Price", text: $price)
                            .keyboardType(.decimalPad)
                    }
                }
                
                NavigationLink(destination: ClosetView().navigationBarHidden(true), isActive: $isActive) { EmptyView() }
                Button(action: {
                    StorageViewModel.shared.createClothingItem(image: uiImage, name: clothingName, color: color, type: selectedType, price: price)
                    isActive = true
                }) {
                    Text("Save")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color(hue: 0.394, saturation: 0.65, brightness: 0.913))
                        .cornerRadius(8)
                }
                .padding()
            }
        }
    }
}
