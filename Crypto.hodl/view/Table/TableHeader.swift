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
				.frame(maxWidth: .infinity)
			Text("Investi")
				.frame(maxWidth: .infinity)
			Text("Actuel")
				.frame(maxWidth: .infinity)
			Text("Gain")
				.frame(maxWidth: .infinity)
			Text("")
				.frame(maxWidth: 48)
		}
		.font(Font.custom("Montserrat-Bold", size: 14))
		.foregroundColor(Color.white)
	}
}

struct TableHeader_Previews: PreviewProvider {
    static var previews: some View {
        TableHeader()
    }
}
