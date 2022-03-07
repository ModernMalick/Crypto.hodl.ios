//
//  TableHeader.swift
//  Crypto.hodl
//
//  Created by Malick NDIAYE on 07/03/2022.
//

import SwiftUI

struct TableHeader: View {
    var body: some View {
		HStack{
			Text("Symbole")
			Text("Investissement")
			Text("Valeur")
			Text("Gain")
		}
    }
}

struct TableHeader_Previews: PreviewProvider {
    static var previews: some View {
        TableHeader()
    }
}
