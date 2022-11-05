//
//  VAstrologieBodies.swift
//  astronumerologie
//
//  Created by Stéphane on 04.11.22.
//

import SwiftUI
import SweSvg

struct VAstrologieBodies: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Binding var swe: SweCore
    @State var bodie: SweCore.Bodies
    @State var swTransit: Bool
    
    var body: some View {
        let colorStroke: Color = colorScheme == .light ? .black : .white
        VStack {
         DrawBodieLine(lines: swe.bodie_lines(bodie: bodie, swTransit: swTransit)).stroke(colorStroke, lineWidth: 1.0)
        }.frame(width: CGFloat(swe.size), height: CGFloat(swe.size))
    }
}

/* TODO later
struct VAstrologieBodies_Previews: PreviewProvider {
    static var previews: some View {
        VAstrologieBodies()
    }
}
*/
