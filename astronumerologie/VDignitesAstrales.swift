//
//  VDignitesAstrales.swift
//  astronumerologie
//
//  Created by Stéphane on 22.11.22.
//

import SwiftUI
import SVGView
import SweBressaniDev

struct VDignitesAstrales: View {
    @Binding var bsSwe: SweCore
    var body: some View {
        VStack {
            HStack {
                Text("Diginité et débilité astrales")
            }
            HStack {
                let b = SweCore.Bodies.Neptune
                SVGView(contentsOf: try! bsSwe.swec.asset_bodie(i: b.rawValue))
                        .frame(width: 25, height: 25)
                        .padding()
                let s = SweCore.Signs.Pisces
                Image(systemName: "wand.and.stars")
                SVGView(contentsOf: try! bsSwe.swec.asset_sign(i: s.rawValue))
                        .frame(width: 25, height: 25)
                        .padding()
                Image(systemName: "wand.and.stars")
            }.frame(maxWidth: .infinity, alignment: .leading)
            HStack {
                let b = SweCore.Bodies.Saturn
                SVGView(contentsOf: try! bsSwe.swec.asset_bodie(i: b.rawValue))
                        .frame(width: 25, height: 25)
                        .padding()
                Image(systemName: "wand.and.stars")
                let s = SweCore.Signs.Aquarius
                SVGView(contentsOf: try! bsSwe.swec.asset_sign(i: s.rawValue))
                    .frame(width: 25, height: 25)
                        .padding()
                let s2 = SweCore.Signs.Capricorn
                VStack {
                    SVGView(contentsOf: try! bsSwe.swec.asset_sign(i: s2.rawValue))
                        .frame(width: 25, height: 25)
                            .padding()
                    Text("").frame(width: 25, height: 1).border(Color.black, width: 1)
                }.padding(0)
                Image(systemName: "wand.and.stars")
            }.frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
        }
    }
}

/*
struct VDignitesAstrales_Previews: PreviewProvider {
    static var previews: some View {
        VDignitesAstrales()
    }
}
*/
