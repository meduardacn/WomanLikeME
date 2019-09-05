//
//  CoreDataCoordinator.swift
//  WomanLikeME
//
//  Created by Giulia Ferraro on 05/09/19.
//  Copyright © 2019 Maria Eduarda Casanova Nascimento. All rights reserved.
//

import Foundation
import CoreData

/*
 let allWoman = coreDataCoordinator.fetchAllWoman()
 let womenOfTheDay = coreDataCoordinator.fetchWomanOfTheDay()
 let favoritedWoman = coreDataCoordinator.fetchFavoritedWomen()
 womenOfTheDay?.saved = true
 coreDataCoordinator.saveChanges()
 */

class CoreDataCoordinator {
    
    var container: NSPersistentContainer!

    init() {
        container = NSPersistentContainer(name: "WomanLikeME")
        
        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                print("Unresolved error \(error)")
            }
        }
        fetchFromPlistIfNeeded()
    }
    
    func saveChanges() {
        if container.viewContext.hasChanges {
            do {
                try container.viewContext.save()
            } catch {
                print("An error occurred while saving: \(error)")
            }
        }
    }
    
    private func fetchFromPlistIfNeeded() {
        let fetchedPlist = UserDefaults.standard.object(forKey: "fetchedPlist") as? Bool ?? false
        
        if !fetchedPlist {
            UserDefaults.standard.set(true, forKey: "fetchedPlist")
            let readingPlist = ReadingPList()
            let allWoman = readingPlist.returningData()
            _ = allWoman.map { woman -> Woman in
                let womanCore = Woman.init(context: container.viewContext)
                womanCore.name = woman["name"] as? String
                womanCore.date = woman["date"] as? String
                womanCore.carrer = woman["carrer"] as? String
                womanCore.textAbout = woman["textAbout"] as? String
                womanCore.image = woman["image"] as? String
                womanCore.phrase = woman["phrase"] as? String
                womanCore.saved = woman["saved"] as? Bool ?? false
                womanCore.appeared = woman["appeared"] as? Bool ?? false
                womanCore.dateAppeared = woman["dateAppeared"] as? String
                womanCore.id = Int64(woman["id"] as! Int)
                return womanCore
            }
            saveChanges()
        }
    }
    
    func fetchAllWoman() -> [Woman] {
        let womanFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Woman")
        let fetchedWoman = try? container.viewContext.fetch(womanFetch) as? [Woman]
        return fetchedWoman ?? []
    }
    
    func fetchFavoritedWomen() -> [Woman] {
        let womanFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Woman")
        womanFetch.predicate = NSPredicate(format: "saved == true")
        
        let fetchedWomen = try? container.viewContext.fetch(womanFetch) as? [Woman]
        return fetchedWomen ?? []
    }
    
    func fetchWomanOfTheDay() -> Woman? {
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "ddMMyyyy"
        let currentDate = formatter.string(from: date)

        let womanFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Woman")
        womanFetch.predicate = NSPredicate(format: "dateAppeared == %@", currentDate)
        
        do {
            var fetchedWomen = try container.viewContext.fetch(womanFetch) as? [Woman] ?? []
            
            if fetchedWomen.isEmpty {
                let womanFetchAppeared = NSFetchRequest<NSFetchRequestResult>(entityName: "Woman")
                womanFetchAppeared.predicate = NSPredicate(format: "appeared == false")
                fetchedWomen = try (container.viewContext.fetch(womanFetchAppeared) as? [Woman])!
                
                let fetchedWoman = fetchedWomen.first
                fetchedWoman?.appeared = true
                fetchedWoman?.dateAppeared = currentDate
                saveChanges()
                
                return fetchedWoman
            }
            
            return fetchedWomen.first
        } catch {
            print(error)
        }
        
        return nil
    }
    
}
