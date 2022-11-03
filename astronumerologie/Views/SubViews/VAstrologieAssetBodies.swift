//
//  VAstrologieAssetBodies.swift
//  astronumerologie
//
//  Created by Stéphane on 03.11.22.
//

import SwiftUI
import SVGView

struct VAstrologieAssetBodies: View {
    @Binding var swe: Swe
    @State var bodie: Bodies
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
