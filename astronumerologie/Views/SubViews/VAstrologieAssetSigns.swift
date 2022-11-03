//
//  VSigns.swift
//  astronumerologie
//
//  Created by Stéphane on 02.11.22.
//

import SwiftUI
import SVGView

struct VAstrologieAssetSigns: View {
    @Binding var swe: Swe
    @State var sign: Int = 0
    var body: some View {
        VStack {
            let s = swe.zodiac_sign(sign: sign)
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
