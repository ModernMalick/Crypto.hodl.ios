//
//  Header.swift
//  Crypto.hodl
//
//  Created by Malick NDIAYE on 06/03/2022.
//

import SwiftUI

struct Header: View {
	var currency: String
	var value: Int64
	var invested: Int64
	var gainsFiat: Int64
	var gainsPercent: Int64
	var image: String
	var color: Color
	
    var body: some View {
		let valueText = String(value) + currency
		let investedText = String(invested) + currency
		let gainsPercentText = String(gainsPercent) + "% "
		let gainsFiatText = String(gainsFiat) + currency
		
		VStack(alignment: .leading){
			Text("Bienvenue sur votre portfolio !")
				.font(Font.custom("Montserrat-Bold", size: 18))
				.frame(maxWidth: .infinity, alignment: .leading)
				.foregroundColor(Color.white)
			Spacer()
				.frame(maxHeight: 4)
			HStack{
				VStack(alignment: .leading){
					HStack{
						Text("Valeur actuelle: ")
							.foregroundColor(Color.white)
						Text(valueText)
							.foregroundColor(color)
					}
					.font(Font.custom("Montserrat-Regular", size: 16))
					Spacer()
						.frame(maxHeight: 4)
					Text("Valeur investie: " + investedText)
						.foregroundColor(Color.white)
					Spacer()
						.frame(maxHeight: 4)
					HStack{
						Text("Gains: ")
							.foregroundColor(Color.white)
						Text(gainsPercentText +  "(" + gainsFiatText + ")")
							.foregroundColor(color)
					}
				}
				.font(Font.custom("Montserrat-Regular", size: 14))
				Spacer()
				Image(image)
					.resizable()
					.frame(width: 64.0, height: 64.0)
			}
		}
		.padding(.top, 24.0)
		.padding()
		.frame(maxWidth: .infinity)
		.background(Color("surface"))
		.cornerRadius(8)
    }
}

struct Header_Previews: PreviewProvider {
	static var previews: some View {
		Header(
			currency: "e", value: 50, invested: 75, gainsFiat: -25, gainsPercent: -33, image: "minus", color: Color.red
		)
	}
}
