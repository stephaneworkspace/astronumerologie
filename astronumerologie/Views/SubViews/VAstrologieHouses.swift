//
//  VAstrologieHouses.swift
//  astronumerologie
//
//  Created by Stéphane on 02.11.22.
//

import SwiftUI

struct HouseLine {
    var lX1: Double
    var lY1: Double
    var lX2: Double
    var lY2: Double
    var lXY3: Bool
    var lX3: Double
    var lY3: Double
}

struct DrawHouseTriangle: Shape {
    var lines: [HouseLine]

    func path(in rect: CGRect) -> Path {
        var path = Path()
        for line in lines {
            if line.lXY3 {
                path.move(to: CGPoint(x: line.lX3, y: line.lY3))
                path.addLine(to: CGPoint(x: line.lX1, y: line.lY1))
                path.addLine(to: CGPoint(x: line.lX2, y: line.lY2))
                path.addLine(to: CGPoint(x: line.lX3, y: line.lY3))
                path.closeSubpath()
            } /*else {
                path.move(to: CGPoint(x: line.lX1, y: line.lY1))
                path.addLine(to: CGPoint(x: line.lX2, y: line.lY2))
                path.closeSubpath()
            }*/
        }
        return path
    }
}

struct VAstrologieHouses: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Binding var swe: Swe
    
    var body: some View {
        let colorStroke: Color = colorScheme == .light ? .black : .white
        VStack {
            DrawHouseTriangle(lines: swe.house_lines()).fill(colorStroke)
        }.frame(width: CGFloat(swe.size), height: CGFloat(swe.size))
    }
}

/* TODO
struct VAstrologieHouses_Previews: PreviewProvider {
    static var previews: some View {
        VAstrologieHouses()
    }
}
*/
