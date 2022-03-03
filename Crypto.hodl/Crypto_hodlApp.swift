//
//  Crypto_hodlApp.swift
//  Crypto.hodl
//
//  Created by Malick NDIAYE on 03/03/2022.
//

import SwiftUI

@main
struct Crypto_hodlApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
