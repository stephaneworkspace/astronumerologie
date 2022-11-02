//
//  VAstrologie.swift
//  astronumerologie
//
//  Created by Stéphane on 02.11.22.
//

import SwiftUI

struct VAstrologie: View {
    @State var swe: Swe
    var body: some View {
        ZStack {
            VStack {
                swe.drawCircle(circles: swe.circles()).stroke(.black, lineWidth: 1.0)
            }.frame(width: CGFloat(swe.size), height: CGFloat(swe.size))
            VStack {
                swe.drawLine(lines: swe.zodiac_lines()).stroke(.black, lineWidth: 1.0)
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
