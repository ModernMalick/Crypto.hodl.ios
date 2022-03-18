//
//  AddAsset.swift
//  Crypto.hodl
//
//  Created by Malick NDIAYE on 08/03/2022.
//

import SwiftUI

struct AddAsset: View {
	var currency: String
	var add: (String, Int64, Int64) -> Void
	@Environment(\.dismiss) var dismiss
	@State private var ticker: String = ""
	@State private var invested: Int64? = nil
	@State private var value: Int64? = nil
	@State private var showMessage = false
	
    var body: some View {
		VStack(){
			Spacer()
			Text("Nouvel Investissement")
				.font(Font.custom("Montserrat-Bold", size: 18))
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
					"BTC",
					text: $ticker
				)
					.padding()
					.background(Color("surface"))
					.cornerRadius(8)
					.font(Font.custom("Montserrat-Bold", size: 16))
					.foregroundColor(Color.white)
					.autocapitalization(.allCharacters)
				Spacer()
			}.padding()
			HStack(alignment: .center){
				Spacer()
				Text("Montant investi en \(currency)")
					.frame(maxWidth: 200, alignment: .leading)
					.font(Font.custom("Montserrat-Regular", size: 16))
					.foregroundColor(Color.white)
				TextField(
					"0",
					value: $invested,
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
					"0",
					value: $value,
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
			if(showMessage){
				Text("Veuillez remplir tous les champs")
					.font(Font.custom("Montserrat-Regular", size: 14))
					.foregroundColor(Color("placeholder"))
					.multilineTextAlignment(.center)
					.padding()
			}
			Spacer()
		}
		.cornerRadius(8)
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(
			LinearGradient(gradient: Gradient(colors: [Color("primary"), Color("secondary")]), startPoint: .topLeading, endPoint: .bottomTrailing)
		)
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
