//
//  ClosetView.swift
//  ClothesScanner
//
//  Created by Riya Setty on 4/18/24.
//

import SwiftUI

struct ClosetView: View {
    @FetchRequest(sortDescriptors: []) var clothingItems: FetchedResults<ClothingItem>
    @State var selectedType = "T-Shirt"
    @State var selectedItem : ClothingItem?
    @State var modalActive = false
    let clothingTypes = ["T-Shirt", "Tops", "Bottoms", "Sleepwear", "Outerwear", "Shoes", "Accessories", "Miscellaneous"]
    
    @State var filteredItems: [String: [ClothingItem]] = [:]
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                if !clothingItems.isEmpty {
                    ForEach(clothingTypes, id: \.self) { type in
                        var filtered = clothingItems.filter ({ $0.type == type })
                        if !filtered.isEmpty {
                            Text(type + " (\(filtered.count))")
                        }
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(filtered, id: \.self) { value in
                                    if let image = value.image, let uiImage = UIImage(data: image) {
                                        Button(action: {
                                            selectedItem = value
                                            modalActive.toggle()
                                        }) {
                                            Image(uiImage: uiImage)
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 200, height: 200)
                                            }
                                        } else {
                                            Text("No image found")
                                    }
                                }
                            }
                        }
                    }
                } else {
                    Text("No items found.")
                }
            }
            .sheet(item: $selectedItem) { item in
                ClothingItemView(item: item)
            }
        }
    }
}

#Preview {
    ClosetView()
}
