//
//  VAstrologieZodiac.swift
//  astronumerologie
//
//  Created by Stéphane on 02.11.22.
//

import SwiftUI
import SweBressaniDev

struct VAstrologieZodiac: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Binding var swe: SweCore
    
    var body: some View {
        let colorStroke: Color = colorScheme == .light ? .black : .white
        VStack {
            DrawCircle(circles: swe.circles()).stroke(colorStroke, lineWidth: 1.0)
        }.frame(width: CGFloat(swe.size), height: CGFloat(swe.size))
        VStack {
            DrawLine(lines: swe.zodiacLines()).stroke(colorStroke, lineWidth: 1.0)
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
