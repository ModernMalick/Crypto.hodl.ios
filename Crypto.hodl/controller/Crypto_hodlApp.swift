//
//  Crypto_hodlApp.swift
//  Crypto.hodl
//
//  Created by Malick NDIAYE on 03/03/2022.
//

import SwiftUI
import CoreData

@main
struct Crypto_hodlApp: App {
	let persistenceContainer = PersistenceController.shared
	
    var body: some Scene {
        WindowGroup {
			Frame()
				.environment(\.managedObjectContext, persistenceContainer.container.viewContext)
		}
    }
}
