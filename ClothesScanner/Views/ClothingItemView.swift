//
//  ClothingItemView.swift
//  ClothesScanner
//
//  Created by Riya Setty on 4/18/24.
//

import SwiftUI

//this is the view that appears when a user clicks into an individual item from the closet screen

struct ClothingItemView: View {
    @State var item: ClothingItem?
    // added to fix but with deleting inside the popup
    @State var onClose: (ClothingItem) -> Void
    
    var body: some View {
        VStack(spacing: 25) {
            if let item = item, let image = item.image {
                Image(uiImage: UIImage(data: image)!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                Spacer().frame(height: 30)
                VStack {
                    Text("Name: \(item.name!)")
                    Text("Color: \(item.color!)")
                    Text("Price: \(item.price!)")
                }
                .padding(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.black, lineWidth: 1)
                )
                Spacer()
                    .frame(height: 50)
                Button(action: {
                    StorageViewModel.shared.deleteClothingItem(item : item)
                }) {
                    Label(
                            title: { Text("Delete from closet") },
                            icon: {
                                Image(systemName: "tshirt.fill")
                                    .foregroundColor(.red)
                            }
                        )
                }
            } else {
                ProgressView("Loading...")
                    .progressViewStyle(CircularProgressViewStyle())
            }
        }
        .onDisappear {
                        if let item = item {
                            onClose(item)
                        }
                    }
    }
}
