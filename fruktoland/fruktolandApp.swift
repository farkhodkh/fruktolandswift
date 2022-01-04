//
//  fruktolandApp.swift
//  fruktoland
//
//  Created by Farkhod Khaknazarov on 05.12.2021.
//

import SwiftUI

@main
struct fruktolandApp: App {
    let persistenceController = FruktoLandPersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            FruktoLandMainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
