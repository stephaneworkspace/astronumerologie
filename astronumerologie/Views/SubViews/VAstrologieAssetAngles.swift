//
//  VAstrologieAssetAngles.swift
//  astronumerologie
//
//  Created by Stéphane on 05.11.22.
//

import SwiftUI
import SVGView

struct VAstrologieAssetAngles: View {
    @Binding var swe: Swe
    @State var angle: Angles
    var body: some View {
        VStack {
            let a = swe.angle(a: angle)
            /* GeometryReader { geometry in
                SVGView(contentsOf: try! swe.swec.asset_bodie(i: bodie.rawValue))
                    .offset(
                        x: b.oPx,
                        y: b.oPy)
                    .frame(
                        width: b.oSx,
                        height: b.oSy)
                if (b.swRetrograde) {
                    SVGView(contentsOf: try! swe.swec.asset_bodie_r(i: bodie.rawValue))
                        .offset(
                            x: b.oPx + b.oSx / RETROGRADE_DIV,
                            y: b.oPy + b.oSy / RETROGRADE_DIV) //
                        .frame(
                            width: b.oSx / RETROGRADE_SIZE_DIV,
                            height: b.oSy / RETROGRADE_SIZE_DIV)
                }
            }*/
        }.frame(width: CGFloat(swe.size), height: CGFloat(swe.size))
    }
}

/* TODO later
struct VAstrologieAssetAngles_Previews: PreviewProvider {
    static var previews: some View {
        VAstrologieAssetAngles()
    }
}
*/
