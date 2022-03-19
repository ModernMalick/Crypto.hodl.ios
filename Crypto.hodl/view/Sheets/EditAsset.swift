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
		VStack(){
			Spacer()
			Text("Mettre à jour votre investissement en " + asset.ticker!)
				.font(Font.custom("Montserrat-Bold", size: 18))
				.multilineTextAlignment(.center)
				.frame(maxWidth: .infinity, alignment: .center)
				.foregroundColor(Color.white)
				.padding()
			Spacer()
			HStack{
				Spacer()
				Text("Symbole")
					.frame(maxWidth: 200, alignment: .leading)
					.font(Font.custom("Montserrat-Regular", size: 16))
					.foregroundColor(Color.white)
				TextField(
					asset.ticker!,
					text: $newTicker
				)
					.padding()
					.background(Color("surface"))
					.cornerRadius(8)
					.font(Font.custom("Montserrat-Bold", size: 16))
					.foregroundColor(Color.white)
					.autocapitalization(.allCharacters)
					.disableAutocorrection(true)
				Spacer()
			}.padding()
			HStack(alignment: .center){
				Spacer()
				Text("Montant investi en \(currency)")
					.frame(maxWidth: 200, alignment: .leading)
					.font(Font.custom("Montserrat-Regular", size: 16))
					.foregroundColor(Color.white)
				TextField(
					String(asset.invested),
					value: $newInvested,
					format: .number
				)
					.padding()
					.background(Color("surface"))
					.cornerRadius(8)
					.font(Font.custom("Montserrat-Bold", size: 16))
					.foregroundColor(Color.white)
					.keyboardType(.numberPad)
				Spacer()
			}.padding()
			HStack(alignment: .center){
				Spacer()
				Text("Valeur actuelle en \(currency)")
					.frame(maxWidth: 200, alignment: .leading)
					.font(Font.custom("Montserrat-Regular", size: 16))
					.foregroundColor(Color.white)
				TextField(
					String(asset.value),
					value: $newValue,
					format: .number
				)
					.padding()
					.background(Color("surface"))
					.cornerRadius(8)
					.font(Font.custom("Montserrat-Bold", size: 16))
					.foregroundColor(Color.white)
					.keyboardType(.numberPad)
				Spacer()
			}.padding()
			Spacer()
			Button {
				save()
			} label: {
				Text("Enregistrer")
					.font(Font.custom("Montserrat-Bold", size: 14))
					.foregroundColor(Color("primary"))
			}
			.padding(.horizontal, 16)
			.padding(.vertical, 12)
			.background(.white)
			.cornerRadius(8)
			Spacer()
		}
		.cornerRadius(8)
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(
			LinearGradient(gradient: Gradient(colors: [Color("primaryVariant"), Color("secondaryVariant")]), startPoint: .topLeading, endPoint: .bottomTrailing)
		)
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
