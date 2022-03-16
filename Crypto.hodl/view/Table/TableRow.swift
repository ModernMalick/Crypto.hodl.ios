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
		HStack(spacing: 0){
			Text(asset.ticker!)
				.multilineTextAlignment(.center)
				.frame(minWidth: 0, maxWidth: .infinity)
			Text(String(asset.invested) + currency)
				.multilineTextAlignment(.center)
				.frame(minWidth: 0, maxWidth: .infinity)
			Text(String(asset.value) + currency)
				.multilineTextAlignment(.center)
				.frame(minWidth: 0, maxWidth: .infinity)
			Text(String(gain) + currency)
				.foregroundColor(getColor())
				.multilineTextAlignment(.center)
				.frame(minWidth: 0, maxWidth: .infinity)
			Image(systemName: "square.and.pencil")
				.frame(minWidth: 0, maxWidth: 48)
				.onTapGesture {
					showEdit.toggle()
					print(asset.ticker!)
				}
				.sheet(isPresented: $showEdit) {
					EditAsset(currency: currency, asset: asset, update: updateAsset(updatedTicker:updatedInvested:updatedValue:))
				}
		}
		.font(Font.custom("Montserrat-Regular", size: 16))
		.foregroundColor(Color.white)
	}
	
	func updateAsset(updatedTicker: String, updatedInvested: Int64, updatedValue: Int64){
		asset.ticker = updatedTicker
		asset.invested = updatedInvested
		asset.value = updatedValue
		save()
	}
	
	func getColor() -> Color{
		if(gain > 0){
			return Color("gainsGood")
		} else if (gain < 0) {
			return Color("gainsBad")
		} else {
			return Color("placeholder")
		}
	}
}
