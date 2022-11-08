//
//  VAstrologieTableau2.swift
//  astronumerologie
//
//  Created by Stéphane on 08.11.22.
//

import SwiftUI
import SweBressaniDev

struct VAstrologieTableau2: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Binding var swe: SweCore
    @State var swTransit1: Bool
    @State var swTransit2: Bool

    var body: some View {
        ZStack {
            // Header
            VStack(spacing: 0) {
                ForEach(swe.bodAng(), id: \.id) { b in
                    switch (b.bodAng) {
                    case .Bodie(let bodie):
                        ZStack(alignment: .topLeading) {
                            VAstrologieTableau2Bodies(swe: $swe, bodie: bodie, i: b.pos)
                        }
                    case .Angle(let angle):
                        ZStack(alignment: .topLeading) {
                            VAstrologieTableau2Angles(swe: $swe, angle: angle, i: b.pos)
                        }
                    }
                }
            }
            // Content
            let ba = swe.bodAng()
            ForEach(ba, id: \.id) { b in
                ZStack(alignment: .topLeading) {
                    ForEach(b.pos...ba.count, id: \.self)  { i in
                        let bodAng = swe.bodAngAspectPos(bodAngPos: b.pos, swTransit1: swTransit1, swTransit2: swTransit2, y: i)
                        if bodAng.1 {
                            if (bodAng.0.pos1 >= ba.count - 2) {
                            } else {
                                VAstrologieTableau2AspectsBodies(swe: $swe, aspect: bodAng.0.aspect, i: bodAng.0.pos1, y: Double(i))
                            }
                        }
                    }
                }
            }
        }
    }
}

/* TODO later
struct VAstrologieTableau2_Previews: PreviewProvider {
    static var previews: some View {
        VAstrologieTableau2()
    }
}
*/
