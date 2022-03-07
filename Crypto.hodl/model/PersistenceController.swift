//
//  PersistenceController.swift
//  Crypto.hodl
//
//  Created by Malick NDIAYE on 06/03/2022.
//

import CoreData

struct PersistenceController{
	static let shared = PersistenceController()
	
	let container: NSPersistentContainer
	
	init(){
		container = NSPersistentContainer(name: "Asset")
		container.loadPersistentStores { (storeDescription, error) in
			if let error = error as NSError? {
				fatalError("Unresolved error: \(error)")
			}
		}
	}
}
