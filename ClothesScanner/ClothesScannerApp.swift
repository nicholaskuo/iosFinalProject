//
//  ClothesScannerApp.swift
//  ClothesScanner
//
//  Created by Nicholas Kuo on 4/13/24.
//

import SwiftUI

@main
struct ClothesScannerApp: App {
    let persistenceController = StorageViewModel.shared
    
    var body: some Scene {
        WindowGroup {
           //ScannerView()
           // ClosetView()
            ContentView()
                .environment(\.managedObjectContext,
                persistenceController.persistentContainer.viewContext)
        }
    }
}
