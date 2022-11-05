//
//  VAstrologieAngles.swift
//  astronumerologie
//
//  Created by Stéphane on 05.11.22.
//

import SwiftUI
import SweSvg

struct VAstrologieAngles: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Binding var swe: SweCore
    @State var angle: SweCore.Angles
    
    var body: some View {
        let l = swe.angle_lines(angle: angle)
        let colorStroke: Color = colorScheme == .light ? .black : .white
        VStack {
            DrawAngleLine(lines: l).stroke(colorStroke, lineWidth: 1.5)
        }.frame(width: CGFloat(swe.size), height: CGFloat(swe.size))
    }
}

/* TODO later
struct VAstrologieAngles_Previews: PreviewProvider {
    static var previews: some View {
        VAstrologieAngles()
    }
}
*/
