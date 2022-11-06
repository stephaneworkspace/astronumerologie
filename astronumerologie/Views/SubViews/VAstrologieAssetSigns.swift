//
//  VSigns.swift
//  astronumerologie
//
//  Created by Stéphane on 02.11.22.
//

import SwiftUI
import SweBressaniDev
import SVGView

struct VAstrologieAssetSigns: View {
    @Binding var swe: SweCore
    @State var sign: Int
    var body: some View {
        VStack {
            let s = swe.zodiacSign(sign: sign)
            GeometryReader { geometry in
                SVGView(contentsOf: try! swe.swec.asset_sign(i: sign))
                    .offset(
                        x: s.oPx,
                        y: s.oPy)
                    .frame(
                        width: s.oSx,
                        height: s.oSy)
            }
        }.frame(width: CGFloat(swe.size), height: CGFloat(swe.size))
    }
}

/* TODO later
struct VSigns_Previews: PreviewProvider {
    static var previews: some View {
        VSigns()
    }
}
*/
