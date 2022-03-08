//
//  AddAsset.swift
//  Crypto.hodl
//
//  Created by Malick NDIAYE on 08/03/2022.
//

import SwiftUI

struct AddAsset: View {
	var currency: String
	var add: (String, Double, Double) -> Void
	@Environment(\.dismiss) var dismiss
	@State private var ticker: String = ""
	@State private var invested: Double? = nil
	@State private var value: Double? = nil
	@State private var showMessage = false
	
    var body: some View {
		VStack{
			TextField(
				"BTC",
				text: $ticker
			).autocapitalization(.allCharacters)
			HStack{
				TextField(
					"Montant investi",
					value: $invested,
					format: .number
				).keyboardType(.numberPad)
				Text(currency)
			}
			HStack{
				TextField(
					"Valeur actuelle",
					value: $value,
					format: .number
				).keyboardType(.numberPad)
				Text(currency)
			}
			Button("Enregistrer") {
				save()
			}
			if(showMessage){
				Text("Veuillez remplir tous les champs")
			}
		}
    }
	
	func save(){
		if(ticker != "" && invested != nil && value != nil){
			add(ticker, invested!, value!)
			dismiss()
		} else {
			showMessage = true
		}
	}
}
