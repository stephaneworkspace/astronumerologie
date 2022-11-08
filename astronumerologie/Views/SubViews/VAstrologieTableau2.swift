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
            // Border
            DrawAspectArray(size: Double(swe.size)).stroke(colorScheme == .light ? .black : .white).offset(x: 7, y: -3)
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

struct DrawAspectArray: Shape {
    var size: Double
    //var transitType: Swe.TransitType TODO
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let cas = Double(size) / 16
        let MAX = 14 // TODO const global
        var max = 14
        //if transitType == .NatalTransit {
        //    max -= 2
        //}
        path.move(to: CGPoint(x: 0, y: cas))
        path.addLine(to: CGPoint(x: 0, y: Double(max + 1) * cas))
        for iDx in 1...max {
            let idx = Double(iDx)
            path.move(to: CGPoint(x: idx * cas, y: idx * cas))
            if iDx == MAX {
                path.addLine(to: CGPoint(x: idx * cas, y: idx * cas))
            } else {
                path.addLine(to: CGPoint(x: idx * cas, y: (idx + 1) * cas))
            }
            if iDx == MAX {
                path.move(to: CGPoint(x: (idx - 1) * cas, y: idx * cas))
            } else {
                path.move(to: CGPoint(x: idx * cas, y: idx * cas))
            }
            path.addLine(to: CGPoint(x: 0, y: idx * cas))
            if iDx == MAX {
                path.move(to: CGPoint(x: (idx - 1) * cas, y: (idx + 1) * cas))
            } else {
                path.move(to: CGPoint(x: idx * cas, y: (idx + 1) * cas))
            }
            path.addLine(to: CGPoint(x: 0, y: (idx + 1) * cas))
            path.move(to: CGPoint(x: idx * cas, y: (idx + 1) * cas))
            path.addLine(to: CGPoint(x: idx * cas, y: Double(max + 1) * cas))
        }
        return path
    }
}

/* TODO later
struct VAstrologieTableau2_Previews: PreviewProvider {
    static var previews: some View {
        VAstrologieTableau2()
    }
}
*/
