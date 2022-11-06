//
//  VAstrologieTableau1.swift
//  astronumerologie
//
//  Created by Stéphane on 06.11.22.
//

import SwiftUI
import SweBressaniDev
import SVGView

struct VAstrologieTableau1: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Binding var swe: SweCore
    @State var bodie: SweCore.Bodies
    @State var swTransit: Bool
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack {
                SVGView(contentsOf: try! swe.swec.asset_bodie(i: bodie.rawValue))
                    .frame(width: 20.0, height: 20.0)
            }.frame(maxWidth: .infinity, alignment: .leading).offset(x: 5, y: 0)
            VStack {
                Text(swe.swec.text_bodie(i: bodie.rawValue))
            }.frame(maxWidth: .infinity, alignment: .leading).offset(x: 30)
        }
    }
}

/* TODO later
struct VAstrologieTableau1_Previews: PreviewProvider {
    static var previews: some View {
        VAstrologieTableau1()
    }
}
*/
