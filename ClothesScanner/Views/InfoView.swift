//
//  InfoView.swift
//  ClothesScanner
//
//  Created by Madelyn Dempsey on 4/23/24.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        VStack{
            Text("Welcome to MyStyle")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            Text("MyStyle is your personal virtual closet assistant. You can add new items to your closet by clicking the camera button on the navigation bar at the bottom of the screen. Here you can scan items from your closet and add information about the item")
                          .multilineTextAlignment(.center)
                          .padding()
            Text("Press the shirt button at the bottom of the screen to view all the items in your closet that have already been added.")
                          .multilineTextAlignment(.center)
                          .padding()
            Text("You can return here any time by clicking the info button on the bottom right. Now get styling!")
                          .multilineTextAlignment(.center)
                          .padding()
            Spacer()
        }
    }
}

#Preview {
    InfoView()
}
