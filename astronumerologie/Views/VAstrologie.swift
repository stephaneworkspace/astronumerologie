//
//  VAstrologie.swift
//  astronumerologie
//
//  Created by Stéphane on 02.11.22.
//

import SwiftUI


struct VAstrologie: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Binding var swe: Swe
    @Binding var bdNatal: Date
    @Binding var bdLat: Double
    @Binding var bdLng: Double
    @Binding var biTimeZone: Int

    var body: some View {
        ZStack {
            let colorStroke: Color = colorScheme == .light ? .black : .white
            VStack {
                swe.drawCircle(circles: swe.circles()).stroke(colorStroke, lineWidth: 1.0)
            }.frame(width: CGFloat(swe.size), height: CGFloat(swe.size))
            VStack {
                swe.drawLine(lines: swe.zodiac_lines()).stroke(colorStroke, lineWidth: 1.0)
            }.frame(width: CGFloat(swe.size), height: CGFloat(swe.size))
            ForEach(1...12, id: \.self)  { i in
                VSigns(swe: $swe, sign: i)
            }
        }
    }
}

/* // TODO
struct VAstrologie_Previews: PreviewProvider {
    static var previews: some View {
        VAstrologie()
    }
}
*/
