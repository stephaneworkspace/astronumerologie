//
//  VAstrologieAssetHouses.swift
//  astronumerologie
//
//  Created by Stéphane on 03.11.22.
//

import SwiftUI
import SweBressaniDev
import SVGView

struct VAstrologieAssetHouses: View {
    @Binding var swe: SweCore
    @State var house: Int
    var body: some View {
        let h = swe.house(number: house)
        VStack {
            GeometryReader { geometry in
                SVGView(contentsOf: try! swe.swec.asset_house(i: house))
                    .offset(
                        x: h.oPx,
                        y: h.oPy)
                    .frame(
                        width: h.oSx,
                        height: h.oSy)
            }
        }.frame(width: CGFloat(swe.size), height: CGFloat(swe.size))
    }
}

/* TODO later
struct VAstrologieAssetHouses_Previews: PreviewProvider {
    static var previews: some View {
        VAstrologieAssetHouses()
    }
}
*/
