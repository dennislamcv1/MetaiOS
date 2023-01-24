//
// Customer+extension.swift



import Foundation
import CoreData


extension Customer {
    
    static func with(fullName: String,
                     _ context:NSManagedObjectContext) -> Customer? {
        let request = Customer.request()
        
        let predicate = NSPredicate(format: "(fullName CONTAINS[cd] %@)", fullName)
        request.predicate = predicate
        
        do {
            guard let results = try context.fetch(request) as? [Customer],
                  results.count > 0
            else { return nil }
            return results.first
        } catch (let error){
            print(error.localizedDescription)
            return nil
        }
    }
    
    private static func request() -> NSFetchRequest<NSFetchRequestResult> {
        let request: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: String(describing: Self.self))
        request.returnsDistinctResults = true
        request.returnsObjectsAsFaults = true
        return request
    }
    
    
    class func deleteAll(_ context:NSManagedObjectContext) {
        let request = Customer.request()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)
        deleteRequest.resultType = .resultTypeObjectIDs
        
        do {
            
            let delete = try context.execute(deleteRequest) as? NSBatchDeleteResult
            
            guard let deleteResult = delete?.result as? [NSManagedObjectID]
            else { return }
            
            let deletedObjects: [AnyHashable: Any] = [NSDeletedObjectsKey: deleteResult]
            
            NSManagedObjectContext.mergeChanges(
                fromRemoteContextSave: deletedObjects,
                into: [context]
            )
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
    }
}
