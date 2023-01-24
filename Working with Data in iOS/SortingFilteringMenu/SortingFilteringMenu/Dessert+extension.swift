//
// Dessert+extension.swift



import Foundation
import CoreData


extension Dessert {
    
    static func consumedByJohnDoe(_ context:NSManagedObjectContext) -> [Dessert]? {
        guard let customer = Customer.with(fullName: "John Doe", context)
        else { return nil }
        
        let request = Dessert.request()
        
        let predicate = NSPredicate(format: "(ANY fromCustomer == %@)", customer)
        request.predicate = predicate
        
        do {
            guard let results = try context.fetch(request) as? [Dessert],
                  results.count > 0
            else { return nil }
            return results
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
        let request = Dessert.request()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)
        
        do {
            guard let persistentStoreCoordinator =
                    context.persistentStoreCoordinator else { return }
            try persistentStoreCoordinator
                .execute(deleteRequest, with: context)
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
    
    class func createDesserts(_ viewContext:NSManagedObjectContext) {
        
        let customer1 = Customer(context: viewContext)
        customer1.fullName = "John Doe"
        customer1.email = "johndoe@example.com"
        
        let customer2 = Customer(context: viewContext)
        customer2.fullName = "Jane Doe"
        customer2.email = "janedoe@example.com"
        
        let profiterole = Dessert(context: viewContext)
        profiterole.name = "Profiterole"
        profiterole.size = "Large"
        profiterole.price = 2.99
        profiterole.fromCustomer = [customer1]

        let profiterole2 = Dessert(context: viewContext)
        profiterole2.name = "Profiterole"
        profiterole2.size = "Extra"
        profiterole2.price = 4.99
        profiterole2.fromCustomer = [customer2]

        let cremeBurlee = Dessert(context: viewContext)
        cremeBurlee.name = "Crème Burlée"
        cremeBurlee.size = "Medium"
        cremeBurlee.price = 3.99
        cremeBurlee.fromCustomer = [customer1]

        
        let cremeBurlee2 = Dessert(context: viewContext)
        cremeBurlee2.name = "Crème Burlée"
        cremeBurlee2.size = "Extra Large"
        cremeBurlee2.price = 5.99
        cremeBurlee2.fromCustomer = [customer2]

        
        let iceCream = Dessert(context: viewContext)
        iceCream.name = "Ice Cream"
        iceCream.size = "Small"
        iceCream.price = 2.99
        iceCream.fromCustomer = [customer1]

        
        let iceCream2 = Dessert(context: viewContext)
        iceCream2.name = "Ice Cream"
        iceCream2.size = "Extra Large"
        iceCream2.price = 6.99
        iceCream2.fromCustomer = [customer2]

        
        let applePie = Dessert(context: viewContext)
        applePie.name = "Apple Pie"
        applePie.size = "Small"
        applePie.price = 2.99
        applePie.fromCustomer = [customer1]

        
        let applePie2 = Dessert(context: viewContext)
        applePie2.name = "Apple Pie"
        applePie2.size = "Full"
        applePie2.price = 12.99
        applePie2.fromCustomer = [customer2]

        
        let imperatrice = Dessert(context: viewContext)
        imperatrice.name = "Riz à l'impératrice"
        imperatrice.size = "Small"
        imperatrice.price = 2.99
        imperatrice.fromCustomer = [customer1]

        
        let cheeseCake = Dessert(context: viewContext)
        cheeseCake.name = "Cheese Cake"
        cheeseCake.size = "Extra Small"
        cheeseCake.price = 4.99
        cheeseCake.fromCustomer = [customer2]

        
        let carrotCake = Dessert(context: viewContext)
        carrotCake.name = "Carrot Cake"
        carrotCake.size = "Standard"
        carrotCake.price = 3.99
        carrotCake.fromCustomer = [customer1]

        
        let piece = Dessert(context: viewContext)
        piece.name = "Pièce montée"
        piece.size = "Medium"
        piece.price = 5.99
        piece.fromCustomer = [customer2]

        
        let eclair = Dessert(context: viewContext)
        eclair.name = "Éclair"
        eclair.size = "Large"
        eclair.price = 3.99
        eclair.fromCustomer = [customer1]

        
        let crepe = Dessert(context: viewContext)
        crepe.name = "Crêpe Suzette"
        crepe.size = "Extra Large"
        crepe.price = 3.99
        crepe.fromCustomer = [customer2]

        
        
        let orangeCake = Dessert(context: viewContext)
        orangeCake.name = "Orange Cake"
        orangeCake.size = "Large"
        orangeCake.price = 3.99
        orangeCake.fromCustomer = [customer1]

        
        
        let vanillaCake = Dessert(context: viewContext)
        vanillaCake.name = "Vanilla Cake"
        vanillaCake.size = "Extra Large"
        vanillaCake.price = 4.99
        vanillaCake.fromCustomer = [customer2]

        
        
        let weddingCake = Dessert(context: viewContext)
        weddingCake.name = "Wedding Cake"
        weddingCake.size = "Regular"
        weddingCake.price = 15.99
        weddingCake.fromCustomer = [customer1]

        
        
        let lemonCake = Dessert(context: viewContext)
        lemonCake.name = "Lemon Cake"
        lemonCake.size = "Regular"
        lemonCake.price = 15.99
        lemonCake.fromCustomer = [customer2]

        
        let bananaCake = Dessert(context: viewContext)
        bananaCake.name = "Banana Cake"
        bananaCake.size = "Regular"
        bananaCake.price = 15.99
        bananaCake.fromCustomer = [customer1]


        Dessert.saveDatabase(viewContext)
    }
    
    
}
