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
	@State private var value: Int64 = 0
	@State private var invested: Int64 = 0
	@State private var gainsFiat: Int64 = 0
	@State private var gainsPercent: Int64 = 0
	@State private var image: String = "minus"
	@State private var color: Color = Color.gray
	@AppStorage("currency") private var currency = "$"
	@State private var showAdd = false
	@State private var showSettings = false
	
    var body: some View {
		VStack{
			Header(
				currency: currency, value: value, invested: invested, gainsFiat: gainsFiat, gainsPercent: gainsPercent, image: image, color: color
			).onAppear(){
				getTotals()
			}
			Spacer()
			VStack{
				TableHeader()
					.padding(.top, 16.0)
				List{
					ForEach(fetchRequest) { asset in
						let gain = asset.value - asset.invested
						TableRow(currency: currency, asset: asset, gain: gain, save: saveVC)
							.padding()
							.listRowBackground(Color("surfaceVariant").cornerRadius(8))
					}
					.onDelete(perform: deleteAsset)
				}
				.onAppear(perform: {
					UITableView.appearance().backgroundColor = .clear
					UITableView.appearance().separatorColor = .clear
					UITableView.appearance().contentInset.top = -35
					UITableView.appearance().separatorInset.bottom = 50
				})
			}
				.background(Color("surface"))
				.cornerRadius(8)
				.padding(16.0)
			Button("Add") {
				showAdd.toggle()
			}.sheet(isPresented: $showAdd) {
				AddAsset(currency: currency, add: addAssetFunc(addedTicker:addedInvested:addedValue:))
			}

			Button("Settings") {
				showSettings.toggle()
			}.sheet(isPresented: $showSettings, onDismiss: checkCurrency) {
				Settings()
			}
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.ignoresSafeArea()
		.background(
			LinearGradient(gradient: Gradient(colors: [Color("primary"), Color("secondary")]), startPoint: .topLeading, endPoint: .bottomTrailing)
		)
    }
	
	func getTotals(){
		value = 0
		invested = 0
		gainsFiat = 0
		gainsPercent = 0
		color = Color("placeholder")
		image = "bankrupt"
		
		for asset in fetchRequest {
			value += asset.value
			invested += asset.invested
			
			gainsFiat = value - invested
			
			if(invested != 0){
				gainsPercent = ((value - invested) * 100) / invested
			} else {
				gainsPercent = 100
			}
			
			if(gainsFiat > 0){
				image = "rocket"
				color = Color("gainsGood")
			} else if(gainsFiat < 0) {
				image = "explosion"
				color = Color("gainsBad")
			}
		}
	}
	
	func addAssetFunc(addedTicker: String, addedInvested: Int64, addedValue: Int64){
		let newAsset = Asset(context: viewContext)
		newAsset.ticker = addedTicker
		newAsset.invested = addedInvested
		newAsset.value = addedValue
		saveVC()
	}
	
	func deleteAsset(at offsets: IndexSet){
		for offset in offsets {
			let asset = fetchRequest[offset]
			viewContext.delete(asset)
		}
		saveVC()
	}
	
	func checkCurrency(){
		if(currency.isEmpty){
			currency = "€"
		}
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
