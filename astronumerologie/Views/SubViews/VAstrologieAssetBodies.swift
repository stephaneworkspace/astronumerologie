//
//  VAstrologieAssetBodies.swift
//  astronumerologie
//
//  Created by Stéphane on 03.11.22.
//

import SwiftUI
import SweSvg
import SVGView

struct VAstrologieAssetBodies: View {
    @Binding var swe: SweCore
    @State var bodie: SweCore.Bodies
    @State var swTransit: Bool
    var body: some View {
        VStack {
            let b = swe.bodie(bodie: bodie, swTransit: swTransit)
            GeometryReader { geometry in
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
            }
        }.frame(width: CGFloat(swe.size), height: CGFloat(swe.size))
    }
}

/* TODO later
struct VAstrologieAssetBodies_Previews: PreviewProvider {
    static var previews: some View {
        VAstrologieAssetBodies()
    }
}
*/
