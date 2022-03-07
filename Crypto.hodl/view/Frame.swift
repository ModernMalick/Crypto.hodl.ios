//
//  Frame.swift
//  Crypto.hodl
//
//  Created by Malick NDIAYE on 06/03/2022.
//

import SwiftUI

struct Frame: View {
	
	@Environment(\.managedObjectContext) private var viewContext
	@FetchRequest(sortDescriptors: [SortDescriptor(\.ticker)]) var fetchRequest: FetchedResults<Asset>
	@State private var value: Double = 0
	@State private var invested: Double = 0
	@State private var gainsFiat: Double = 0
	@State private var gainsPercent: Double = 0
	@State private var image: String = "minus"
	@State private var color: Color = Color.gray
	@AppStorage("currency") private var currency = "$"
	
    var body: some View {
		VStack{
			Header(
				currency: currency, value: value, invested: invested, gainsFiat: gainsFiat, gainsPercent: gainsPercent, image: image, color: color
			).onAppear(){
				getTotals()
			}
			
			VStack{
				List{
					TableHeader()
					ForEach(fetchRequest) { asset in
						let gain = asset.value - asset.invested
						TableRow(currency: currency, asset: asset, gain: gain)
					}.onDelete(perform: deleteAsset)
				}
			}
			
			Button("Add", action: addAsset)
		}

    }
	
	func getTotals(){
		value = 0
		invested = 0
		
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
	
	func addAsset(){
		let newAsset = Asset(context: viewContext)
		newAsset.ticker = "BTC"
		newAsset.invested = 50
		newAsset.value = 75
		saveVC()
	}
	
	func deleteAsset(at offsets: IndexSet){
		for offset in offsets {
			let asset = fetchRequest[offset]
			viewContext.delete(asset)
		}
		saveVC()
	}
	
	func saveVC(){
		do {
			try viewContext.save()
			getTotals()
		} catch {
			let error = error as NSError
			fatalError("Unresolved Error: \(error)")
		}
	}
}

struct Frame_Previews: PreviewProvider {
    static var previews: some View {
        Frame()
    }
}
