//
//  VAstrologieTableau2AspectsBodies.swift
//  astronumerologie
//
//  Created by Stéphane on 08.11.22.
//

import SwiftUI
import SweBressaniDev
import SVGView

struct VAstrologieTableau2AspectsBodies: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Binding var swe: SweCore
    @State var aspect: SweCore.Aspects
    @State var i: Int
    @State var y: Double
    let fix = -152.0
    let bodPos = CGFloat((300 / 2) * -1)
    let cas = Double(300) / 16.0
    let casDivx = 1.00
    let casDiv = 1.07

    
    //let yPos = bodPos + (cas / 2) + (cas * Double(i)) - fix
    var body: some View {
        let xPos = bodPos + (cas / 2) + (cas * Double(i) * casDivx) - fix
        let yPos = bodPos + (cas * (y + 1) * casDiv)
        VStack {
            if (aspect.rawValue >= 0) {
                SVGView(contentsOf: try! swe.swec.asset_aspect(i: aspect.rawValue))
                    .frame(width: 16.0, height: 16.0)
            }
        }.frame(maxWidth: .infinity, alignment: .leading).offset(x: xPos, y: yPos)

    }
}

/* TODO later
struct VAstrologieTableau2AspectsBodies_Previews: PreviewProvider {
    static var previews: some View {
        VAstrologieTableau2AspectsBodies()
    }
}
*/
