//
//  VAstrologieTableau1Signs.swift
//  astronumerologie
//
//  Created by Stéphane on 06.11.22.
//

import SwiftUI
import SweBressaniDev
import SVGView

struct VAstrologieTableau1Signs: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Binding var swe: SweCore
    @State var bodie: SweCore.Bodies
    @State var swTransit: Bool
    let offset = 120.0
    
    var body: some View {
        if !swTransit {
            // Natal
            VStack {
                SVGView(contentsOf: try! swe.swec.asset_sign(i: swe.bodieSign(bodie: bodie, swTransit: false)))
                    .frame(width: 20.0, height: 20.0)
            }.frame(maxWidth: .infinity, alignment: .leading).offset(x: 145, y: 0)
        } else {
            // Transit
            VStack {
                SVGView(contentsOf: try! swe.swec.asset_sign(i: swe.bodieSign(bodie: bodie, swTransit: true)))
                    .frame(width: 20.0, height: 20.0)
            }.frame(maxWidth: .infinity, alignment: .leading).offset(x: 270, y: 0)
        }
        let degMinSec = swe.bodieDegMinSec(bodie: bodie, swTransit: swTransit)
        VStack {
            Text("°")
        }.frame(maxWidth: .infinity, alignment: .leading).offset(x: swTransit ? 195 : 195 + offset)
        VStack {
            Text(degMinSec.0.formatted())
        }.frame(maxWidth: 25, alignment: .trailing).offset(x: swTransit ? 170 : 170 + offset)
        VStack {
            Text("'")
        }.frame(maxWidth: .infinity, alignment: .leading).offset(x: swTransit ? 225 : 225 + offset)
        VStack {
            Text(degMinSec.1.formatted())
        }.frame(maxWidth: 25, alignment: .trailing).offset(x: swTransit ? 200 : 200 + offset)
        VStack {
            Text("\"")
        }.frame(maxWidth: .infinity, alignment: .leading).offset(x: swTransit ? 255 : 255 + offset)
        VStack {
            Text(degMinSec.2.formatted())
        }.frame(maxWidth: 25, alignment: .trailing).offset(x: swTransit ? 230 : 230 + offset)
    }
}

/* TODO later
struct VAstrologieTableau1Signs_Previews: PreviewProvider {
    static var previews: some View {
        VAstrologieTableau1Signs()
    }
}
*/
