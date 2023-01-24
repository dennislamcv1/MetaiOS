//
// CoreDataListExerciseApp.swift



import SwiftUI
import CoreData

@main
struct CoreDataListExerciseApp: App {
    let persistenceController = PersistenceController.shared
    
    init() {
        Dessert.deleteAll(persistenceController.container.viewContext)
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
