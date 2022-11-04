//
//  VAstrologieBodies.swift
//  astronumerologie
//
//  Created by Stéphane on 04.11.22.
//

import SwiftUI

struct DrawBodieLine: Shape {
    var lines: [Swe.Line]
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        for line in lines {
            path.move(to: CGPoint(x: line.lX1, y: line.lY1))
            path.addLine(to: CGPoint(x: line.lX2, y: line.lY2))
            path.closeSubpath()
        }
        return path
    }
}

struct VAstrologieBodies: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Binding var swe: Swe
    @State var bodie: Bodies
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
