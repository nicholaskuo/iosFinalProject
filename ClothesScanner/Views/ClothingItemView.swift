//
//  ClothingItemView.swift
//  ClothesScanner
//
//  Created by Riya Setty on 4/18/24.
//

import SwiftUI

struct ClothingItemView: View {
    @State var item: ClothingItem?
    var body: some View {
        VStack {
            if let item = item {
                Image(uiImage: UIImage(data: item.image!)!)
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
            } else {
                ProgressView("Loading...")
                    .progressViewStyle(CircularProgressViewStyle())
            }
        }
    }
}

//#Preview {
//    ClothingItemView()
//}
