//
//  VSigns.swift
//  astronumerologie
//
//  Created by Stéphane on 02.11.22.
//

import SwiftUI
import SVGView

struct VSigns: View {
    @Binding var swe: Swe
    @State var sign: Int = 0
    var body: some View {
        VStack {
            GeometryReader { geometry in
                SVGView(contentsOf: try! swe.swec.asset_sign(i: sign))
                    .offset(
                        x: swe.zodiac_sign(sign: sign).oPx,
                        y: swe.zodiac_sign(sign: sign).oPy)
                    .frame(
                        width: swe.zodiac_sign(sign: sign).oSx,
                        height: swe.zodiac_sign(sign: sign).oSy)
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
