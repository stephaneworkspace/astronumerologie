//
//  VAstrologieAssetAngles.swift
//  astronumerologie
//
//  Created by Stéphane on 05.11.22.
//

import SwiftUI
import SVGView
import SweSvg

struct VAstrologieAssetAngles: View {
    @Binding var swe: SweCore
    @State var angle: SweCore.Angles
    var body: some View {
        VStack {
            let a = swe.angle(a: angle)
            GeometryReader { geometry in
                SVGView(contentsOf: try! swe.swec.asset_angle(i: Int(angle.rawValue)))
                    .offset(
                        x: a.oPx,
                        y: a.oPy)
                    .frame(
                        width: a.oSx,
                        height: a.oSy)
            }
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
