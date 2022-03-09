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
		
		HStack{
			VStack{
				Text("Bienvenue sur votre portfolio")
				HStack{
					Text("Valeur actuelle: ")
					Text(valueText)
						.foregroundColor(color)
				}
				Text("Valeur investie: " + investedText)
				HStack{
					Text("Gains: ")
					Text(gainsPercentText +  "(" + gainsFiatText + ")")
						.foregroundColor(color)
				}
			}
			Image(systemName: self.image)
				.foregroundColor(self.color)
				.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
				.frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
		}
    }
}

struct Header_Previews: PreviewProvider {
	static var previews: some View {
		Header(
			currency: "e", value: 50, invested: 75, gainsFiat: -25, gainsPercent: -33, image: "minus", color: Color.red
		)
	}
}
