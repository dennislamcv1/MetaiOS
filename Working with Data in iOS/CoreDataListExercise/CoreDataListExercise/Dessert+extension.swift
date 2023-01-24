//
// Dessert+extension.swift



import Foundation
import CoreData


extension Dessert {
    
    private static func request() -> NSFetchRequest<NSFetchRequestResult> {
        let request: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: String(describing: Self.self))
        request.returnsDistinctResults = true
        request.returnsObjectsAsFaults = true
        return request
    }
    
    class func deleteAll(_ context:NSManagedObjectContext) {
        let request = Dessert.request()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)
        
        do {
            guard let persistentStoreCoordinator = context.persistentStoreCoordinator else { return }
            try persistentStoreCoordinator.execute(deleteRequest, with: context)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    class func saveDatabase(_ context:NSManagedObjectContext) {
        guard context.hasChanges else { return}
        do {
            try context.save()
        } catch (let error) {
            print(error.localizedDescription)
        }
    }
    
    
}
