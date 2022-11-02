//
//  VAstrologieZodiac.swift
//  astronumerologie
//
//  Created by Stéphane on 02.11.22.
//

import SwiftUI

struct VAstrologieZodiac: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Binding var swe: Swe
    
    var body: some View {
        let colorStroke: Color = colorScheme == .light ? .black : .white
        VStack {
            swe.drawCircle(circles: swe.circles()).stroke(colorStroke, lineWidth: 1.0)
        }.frame(width: CGFloat(swe.size), height: CGFloat(swe.size))
        VStack {
            swe.drawLine(lines: swe.zodiac_lines()).stroke(colorStroke, lineWidth: 1.0)
        }.frame(width: CGFloat(swe.size), height: CGFloat(swe.size))
    }
}
/* TODO
struct VAstrologieZodiac_Previews: PreviewProvider {
    static var previews: some View {
        VAstrologieZodiac()
    }
}
*/
