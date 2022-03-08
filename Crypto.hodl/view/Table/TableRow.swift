//
//  TableRow.swift
//  Crypto.hodl
//
//  Created by Malick NDIAYE on 07/03/2022.
//

import SwiftUI

struct TableRow: View {
	var currency: String
	var asset: Asset
	var gain: Double
	
    var body: some View {
		HStack{
			Text(asset.ticker!)
			Text(String(asset.invested) + currency)
			Text(String(asset.value) + currency)
			Text(String(gain) + currency)
				.foregroundColor(getColor())
		}
    }
	
	func getColor() -> Color{
		if(gain > 0){
			return Color.green
		} else if (gain < 0) {
			return Color.red
		} else {
			return Color.gray
		}
	}
}
