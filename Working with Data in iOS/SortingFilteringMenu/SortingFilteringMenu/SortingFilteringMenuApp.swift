//
// SortingFilteringMenuApp.swift



import SwiftUI
import CoreData

@main
struct SortingFilteringMenuApp: App {
    let persistenceController = PersistenceController.shared
    
    init() {
        Dessert.deleteAll(persistenceController.container.viewContext)
        Customer.deleteAll(persistenceController.container.viewContext)
        Dessert.createDesserts(persistenceController.container.viewContext)
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
