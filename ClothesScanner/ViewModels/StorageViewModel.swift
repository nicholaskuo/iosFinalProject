//
//  StorageViewModel.swift
//  ClothesScanner
//
//  Created by Riya Setty on 4/22/24.
//

import Foundation
import SwiftUI
import CoreData

class StorageViewModel: ObservableObject {
    static let shared = StorageViewModel()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        
        container.loadPersistentStores { stores, error in
            if let error {
                fatalError("Oh no! \(error.localizedDescription)")
            }
        }
        return container
    }()
    
    func createClothingItem(image: UIImage, name: String, color: String, type: String, price: String) {
        
        guard let compressedImage = image.jpegData(compressionQuality: 1.0) else
            {
                print("ERROR COMPRESSING IMAGE")
                return
            }
        
        let item = ClothingItem(context: persistentContainer.viewContext)
        item.id = UUID()
        item.image = compressedImage
        item.name = name
        item.color = color
        item.type = type
        item.price = price
        
        save()
    }
    
    func deleteClothingItem() {}
    
//    func deleteWeatherItem(location: String, timestamp: Date) {
//        let fetchRequest: NSFetchRequest<WeatherItem> = WeatherItem.fetchRequest()
//        
//        // Use both location and timestamp as criteria to find a specific WeatherItem
//        let locationPredicate = NSPredicate(format: "location == %@", location)
//        let timestampPredicate = NSPredicate(format: "timestamp == %@", timestamp as NSDate)
//        let compoundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [locationPredicate, timestampPredicate])
//        fetchRequest.predicate = compoundPredicate
//        
//        do {
//            let itemsToDelete = try persistentContainer.viewContext.fetch(fetchRequest)
//            for item in itemsToDelete {
//                persistentContainer.viewContext.delete(item)
//            }
//            save()
//        } catch {
//            print("Couldn't delete: \(error)")
//        }
//    }
//    

//    
//    func isLocationFavorited(locName: String) -> Bool {
//        let fetchRequest: NSFetchRequest<LocationItem> = LocationItem.fetchRequest()
//        let locations = try? persistentContainer.viewContext.fetch(fetchRequest)
//        if locations == nil {
//            return false
//        }
//        for location in locations! {
//            if locName == location.location {
//                return true
//            }
//        }
//        return false
//    }
//  
    func save() {
        guard persistentContainer.viewContext.hasChanges else { return }
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Couldn't save: \(error)")
        }
    }
    
    private init() {}
}
