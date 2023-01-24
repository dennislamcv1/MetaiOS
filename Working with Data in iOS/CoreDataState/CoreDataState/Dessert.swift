import Foundation
import CoreData

class Dessert: NSManagedObject, Identifiable {
    @NSManaged var name: String?
    @NSManaged var size: String?
    @NSManaged var price: Double
}
