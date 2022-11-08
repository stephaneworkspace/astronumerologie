//
//  VAstrologieTableau2AspectsBodies.swift
//  astronumerologie
//
//  Created by Stéphane on 08.11.22.
//

import SwiftUI
import SweBressaniDev
import SVGView

struct VAstrologieTableau2AspectsBodies: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Binding var swe: SweCore
    @State var aspect: SweCore.Aspects
    @State var i: Int
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

/* TODO later
struct VAstrologieTableau2AspectsBodies_Previews: PreviewProvider {
    static var previews: some View {
        VAstrologieTableau2AspectsBodies()
    }
}
*/
