//
//  VAstrologieTableau2.swift
//  astronumerologie
//
//  Created by Stéphane on 08.11.22.
//

import SwiftUI
import SweBressaniDev
import SVGView

struct VAstrologieTableau2Bodies: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Binding var swe: SweCore
    @State var bodie: SweCore.Bodies
    @State var i: Int

    var body: some View {
        let xPos = VAstrologieTableau2BodiesxPos(size: swe.size, i: i)
        var yPos = VAstrologieTableau2BodiesyPos(i: i)
        VStack {
            SVGView(contentsOf: try! swe.swec.asset_bodie(i: bodie.rawValue))
                .frame(width: 20.0, height: 20.0)
        }.frame(maxWidth: .infinity, alignment: .leading).offset(x: xPos, y: yPos)
    }
}

func VAstrologieTableau2BodiesbodPos(size: Int) -> Double {
    return (Double(size) / 2.0) * -1.0
}

func VAstrologieTableau2Bodiescas(size: Int) -> Double {
    return Double(size) / 16.0
}

func VAstrologieTableau2BodiesxPos(size: Int, i: Int) -> Double {
    let fix = 210.0
    let bodPos = VAstrologieTableau2BodiesbodPos(size: size)
    let cas = VAstrologieTableau2Bodiescas(size: size)
    return bodPos  + (cas * Double(i)) + fix
}

func VAstrologieTableau2BodiesyPos(i: Int) -> Double {
    switch (i) {
    case 1:
        return Double(i) * 2.0
    case 2:
        return Double(i) * 3.0
    case 3:
        return Double(i) * 5.0
    default:
        return Double(i) * 5.0
    }
}

/* TODO later
struct VAstrologieTableau2_Previews: PreviewProvider {
    static var previews: some View {
        VAstrologieTableau2Bodies()
    }
}
*/
