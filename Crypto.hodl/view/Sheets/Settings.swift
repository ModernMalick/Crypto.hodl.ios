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
		HStack{
			Text("Devise")
			TextField(
				currency,
				text: $currency
			)
			Button("Enregistrer") {
				dismiss()
			}
		}
	}
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
