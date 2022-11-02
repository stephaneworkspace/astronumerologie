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
            ForEach(1...12, id: \.self) { idx in
                VStack {
                    // TODO enlever
                    //let _ = cwrapper.a_sign(Int32(idx))
                    //let url = cwrapper.a_sign(Int32(idx)).1
                    //let ui = AppKit.UIImage(contentsOfFile: url.path)
                    GeometryReader { geometry in
                        Image(String(format: "asset_%d_sign", idx))
                                .resizable()
                                .offset(
                                        x: swe.zodiac_sign(sign: Int32(idx)).oPx,
                                        y: swe.zodiac_sign(sign: Int32(idx)).oPy)
                                .frame(
                                        width: swe.zodiac_sign(sign: Int32(idx)).oSx,
                                        height: swe.zodiac_sign(sign: Int32(idx)).oSy)
                    }
                }.frame(width: CGFloat(swe.size), height: CGFloat(swe.size))
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
