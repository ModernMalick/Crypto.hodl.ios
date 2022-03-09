//
//  EditAsset.swift
//  Crypto.hodl
//
//  Created by Malick NDIAYE on 09/03/2022.
//

import SwiftUI

struct EditAsset: View {
	var currency: String
	var asset: Asset
	var update: (String, Int64, Int64) -> Void
	@Environment(\.dismiss) var dismiss
	@State private var newTicker: String = ""
	@State private var newInvested: Int64? = nil
	@State private var newValue: Int64? = nil
	
	var body: some View {
		VStack{
			TextField(
				asset.ticker!,
				text: $newTicker
			).autocapitalization(.allCharacters)
			HStack{
				TextField(
					String(asset.invested),
					value: $newInvested,
					format: .number
				).keyboardType(.numberPad)
				Text(currency)
			}
			HStack{
				TextField(
					String(asset.value),
					value: $newValue,
					format: .number
				).keyboardType(.numberPad)
				Text(currency)
			}
			Button("Enregistrer") {
				save()
			}
		}
	}
	
	func save(){
		var updateTicker: String = asset.ticker!
		var updateInvested: Int64 = asset.invested
		var updateValue: Int64 = asset.value
		if(!newTicker.isEmpty){
			updateTicker = newTicker
		}
		if(newInvested != nil){
			updateInvested = newInvested!
		}
		if(newValue != nil){
			updateValue = newValue!
		}
		update(updateTicker, updateInvested, updateValue)
		dismiss()
	}
}
