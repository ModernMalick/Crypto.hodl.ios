//
//  Frame.swift
//  Crypto.hodl
//
//  Created by Malick NDIAYE on 06/03/2022.
//

import SwiftUI

struct Frame: View {
	
	@FetchRequest(sortDescriptors: [SortDescriptor(\.ticker)]) var fetchRequest: FetchedResults<Asset>
	@State private var value: Double = 0
	@State private var invested: Double = 0
	@State private var gainsFiat: Double = 0
	@State private var gainsPercent: Double = 0
	@State private var image: String = "minus"
	@State private var color: Color = Color.gray
	
	@AppStorage("currency") private var currency = "$"
	
    var body: some View {
		Header(
			currency: currency, value: value, invested: invested, gainsFiat: gainsFiat, gainsPercent: gainsPercent, image: image, color: color
		).onAppear(){
			getTotals()
		}
    }
	
	func getTotals(){
		for asset in fetchRequest {
			value += asset.value
			invested += asset.invested
			if(invested != 0){
				gainsFiat = value - invested
				gainsPercent = ((value - invested) * 100) / invested
			}
			if(gainsFiat > 0){
				image = "plus"
				color = Color.green
			} else {
				image = "multiply"
				color = Color.red
			}
		}
	}
}

struct Frame_Previews: PreviewProvider {
    static var previews: some View {
        Frame()
    }
}
