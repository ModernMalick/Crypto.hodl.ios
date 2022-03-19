//
//  Settings.swift
//  Crypto.hodl
//
//  Created by Malick NDIAYE on 09/03/2022.
//

import SwiftUI

struct Settings: View {
	@Environment(\.dismiss) var dismiss
	@AppStorage("currency") private var currency = "$"
	
    var body: some View {
		VStack{
			Spacer()
			Text("Paramètres")
				.font(Font.custom("Montserrat-Bold", size: 18))
				.frame(maxWidth: .infinity, alignment: .center)
				.foregroundColor(Color.white)
				.padding()
			Spacer()
			HStack{
				Spacer()
				Text("Devise")
					.font(Font.custom("Montserrat-Regular", size: 16))
					.foregroundColor(Color.white)
					.padding()
					.padding(16)
				TextField(
					currency,
					text: $currency
				)
					.frame(maxWidth: 100, alignment: .leading)
					.padding()
					.background(Color("surface"))
					.cornerRadius(8)
					.font(Font.custom("Montserrat-Bold", size: 16))
					.foregroundColor(Color.white)
					.padding(16)
					.disableAutocorrection(true)
				Spacer()
			}
			Spacer()
			VStack{
				Link(destination: URL(string:"https://apps.apple.com/us/app/cappsule-minimalist-wardrobe/id1610504663")!,
					 label: {
					Text("Noter Crypto.hodl")
						.font(Font.custom("Montserrat-Regular", size: 16))
						.foregroundColor(.white)
						.underline()
				})
					.padding()
				Link(destination: URL(string:"https://modernmalick.com")!,
					 label: {
					Text("Mon site web")
						.font(Font.custom("Montserrat-Regular", size: 16))
						.foregroundColor(.white)
						.underline()
				})
					.padding()
				Link(destination: URL(string:"https://flaticon.com")!,
					 label: {
					Text("Icônes provenants de flaticon.com")
						.font(Font.custom("Montserrat-Regular", size: 16))
						.foregroundColor(Color("placeholder"))
						.underline()
				})
				.padding()
			}
			Spacer()
			Button {
				dismiss()
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
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
