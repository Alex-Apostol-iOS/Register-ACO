//
//  CoreDataController.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 6/12/22.
//

import Foundation
import CoreData


protocol CoreDataControllerProtcol {}

extension CoreDataControllerProtcol {
    
    func putItem<T: Codable>(_ entityName: String, common: T) {
        AppManager.sharedInstace.coreData.putItem(entityName, common: common)
    }
    
    func queryItem<T: Decodable>(entityName: String, item: T.Type) -> T? {
        AppManager.sharedInstace.coreData.queryItem(entityName: entityName, item: item)
    }
    
    func delete(entityName: String) {
        AppManager.sharedInstace.coreData.delete(entityName: entityName)
    }
    
}

class CoreDateController {
    private let coreDatakey = "RegisterAcoCoreData"
    
    private lazy var persistentContainer: NSPersistentContainer = {
            let container = NSPersistentContainer(name: coreDatakey)
            container.loadPersistentStores { description, error in
                if let error = error {
                    fatalError("Unable to load persistent stores: \(error)")
                }
            }
            return container
        }()
    
    enum EntityKey: String {
        case user = "User"
        case jsonDataKey = "jsonData"
    }
    
    init() {
    }
    
    func queryItem<T: Decodable>(entityName: String, item: T.Type) -> T? {
        let context =  persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        request.returnsObjectsAsFaults = false
        
        do {
            guard let result = try context.fetch(request).first as? NSManagedObject,
                  let jsonData = result.value(forKey: EntityKey.jsonDataKey.rawValue) as? Data else { return nil }
            
            return try JSONDecoder().decode(T.self, from: jsonData)
        }
        catch {
            return nil
        }
    }
    
    
    func putItem<T: Codable>(_ entityName: String, common: T) {
        delete(entityName: entityName)
        let jsonData = try! JSONEncoder().encode(common)
        
        let context =  persistentContainer.viewContext
        let clientConfigQueryResult = NSEntityDescription.insertNewObject(forEntityName: entityName, into: context)
        clientConfigQueryResult.setValue(jsonData, forKey: EntityKey.jsonDataKey.rawValue)
        do {
            try context.save()
        } catch {
            print("Core Data Error put item: \(error)")
        }
    }
    
     func delete(entityName: String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try persistentContainer.viewContext.execute(deleteRequest)
        } catch let error as NSError {
            debugPrint(error)
        }
    }
    
}
