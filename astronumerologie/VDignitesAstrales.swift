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
        HStack {
            let b = SweCore.Bodies.Soleil
            Text(bsSwe.swec.text_bodie(i: b.rawValue))
            GeometryReader { geometry in
                SVGView(contentsOf: try! bsSwe.swec.asset_bodie(i: b.rawValue))
                        .frame(width: 25, height: 25)
                        .padding()
            }
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
