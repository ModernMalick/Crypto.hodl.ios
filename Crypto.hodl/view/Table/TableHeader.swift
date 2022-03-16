//
//  TableHeader.swift
//  Crypto.hodl
//
//  Created by Malick NDIAYE on 07/03/2022.
//

import SwiftUI

struct TableHeader: View {
    var body: some View {
		HStack(spacing: 0){
			Text("Symbole")
				.multilineTextAlignment(.center)
				.frame(minWidth: 0, maxWidth: .infinity)
			Text("Investi")
				.multilineTextAlignment(.center)
				.frame(minWidth: 0, maxWidth: .infinity)
			Text("Actuel")
				.multilineTextAlignment(.center)
				.frame(minWidth: 0, maxWidth: .infinity)
			Text("Gain")
				.multilineTextAlignment(.center)
				.frame(minWidth: 0, maxWidth: .infinity)
			Text("")
				.multilineTextAlignment(.center)
				.frame(minWidth: 0, maxWidth: 48)
		}
		.font(Font.custom("Montserrat-Bold", size: 16))
		.foregroundColor(Color.white)
	}
}

struct TableHeader_Previews: PreviewProvider {
    static var previews: some View {
        TableHeader()
    }
}
