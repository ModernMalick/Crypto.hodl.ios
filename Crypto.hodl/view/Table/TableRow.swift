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
	var gain: Int64
	var save: () -> Void
	@State private var showEdit: Bool = false
	
	
    var body: some View {
		HStack{
			Text(asset.ticker!)
			Text(String(asset.invested) + currency)
			Text(String(asset.value) + currency)
			Text(String(gain) + currency)
				.foregroundColor(getColor())
			Image(systemName: "square.and.pencil")
				.onTapGesture {
					showEdit.toggle()
					print(asset.ticker!)
				}
				.sheet(isPresented: $showEdit) {
					EditAsset(currency: currency, asset: asset, update: updateAsset(updatedTicker:updatedInvested:updatedValue:))
				}
		}
    }
	
	func updateAsset(updatedTicker: String, updatedInvested: Int64, updatedValue: Int64){
		asset.ticker = updatedTicker
		asset.invested = updatedInvested
		asset.value = updatedValue
		save()
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
