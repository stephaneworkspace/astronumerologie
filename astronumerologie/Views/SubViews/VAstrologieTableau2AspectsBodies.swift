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
    
    var body: some View {
        let xPos = VAstrologieTableau2AspectsBodiesxPos(size: swe.size, i: i)
        let yPos = VAstrologieTableau2AspectsBodiesyPos(size: swe.size, y: y)
        VStack {
            if (aspect.rawValue >= 0) {
                SVGView(contentsOf: try! swe.swec.asset_aspect(i: aspect.rawValue))
                    .frame(width: 16.0, height: 16.0)
            }
        }.frame(maxWidth: .infinity, alignment: .leading).offset(x: xPos, y: yPos)

    }
}

func VAstrologieTableau2AspectsBodiesbodPos(size: Int) -> Double {
    return Double((Double(size) / 2.0) * -1.0)
}

func VAstrologieTableau2AspectsBodiescas(size: Int) -> Double {
    return Double(size) / 16.0
}

func VAstrologieTableau2AspectsBodiesxPos(size: Int, i: Int) -> Double {
    let cas = VAstrologieTableau2AspectsBodiescas(size: size)
    let bodPos = VAstrologieTableau2AspectsBodiesbodPos(size: size)
    let casDivx = 1.00
    let fix = 200.0
    return bodPos + (cas / 2.0) + (cas * Double(i) * casDivx) + fix
}

func VAstrologieTableau2AspectsBodiesyPos(size: Int, y: Double) -> Double {
    let cas = VAstrologieTableau2AspectsBodiescas(size: size)
    let bodPos = VAstrologieTableau2AspectsBodiesbodPos(size: size)
    let casDiv = 1.0
    let fix = 50.0
    return bodPos + (cas * (y + 1.0) * casDiv) + fix;
}

/* TODO later
struct VAstrologieTableau2AspectsBodies_Previews: PreviewProvider {
    static var previews: some View {
        VAstrologieTableau2AspectsBodies()
    }
}
*/
