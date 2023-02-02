//
//  Little_Lemon_AppApp.swift
//  Little Lemon App
//
//  Created by Vitaliy Iakushev on 30.01.2023.
//

import SwiftUI

@main
struct Little_LemonApp: App {
//    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            Onboarding()
                .onAppear(perform: UIApplication.shared.addTapGestureRecognizer)
                // For closing keyboard by Tap outside of textfield
        }
    }
}
