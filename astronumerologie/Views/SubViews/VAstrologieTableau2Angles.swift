//
//  VAstrologieTableau2Angles.swift
//  astronumerologie
//
//  Created by Stéphane on 08.11.22.
//

import SwiftUI
import SweBressaniDev
import SVGView

struct VAstrologieTableau2Angles: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Binding var swe: SweCore
    @State var angle: SweCore.Angles
    @State var i: Int
    let fix = -150.0
    let bodPos = CGFloat((300 / 2) * -1)
    let cas = Double(300) / 16.0
    let casDiv = 1.1
    
    var body: some View {
        let xPos = VAstrologieTableau2AnglesxPos(size: swe.size, i: i)
        let yPos = VAstrologieTableau2AnglesyPos(i: i, angle: angle)
        VStack {
            SVGView(contentsOf: try! swe.swec.asset_angle(i: Int(angle.rawValue)))
                .frame(width: 20.0, height: 20.0)
        }.frame(maxWidth: .infinity, alignment: .leading).offset(x: xPos, y: yPos)
    }
}

func VAstrologieTableau2AnglesbodPos(size: Int) -> Double {
    return (Double(size) / 2.0) * -1.0
}

func VAstrologieTableau2Anglescas(size: Int) -> Double {
    return Double(size) / 16.0
}

func VAstrologieTableau2AnglesxPos(size: Int, i: Int) -> Double {
    let fix = 210.0
    let bodPos = VAstrologieTableau2AnglesbodPos(size: size)
    let cas = VAstrologieTableau2Anglescas(size: size)
    return bodPos  + (cas * Double(i)) + fix
}

func VAstrologieTableau2AnglesyPos(i: Int, angle: SweCore.Angles) -> Double {
    if (angle == SweCore.Angles.Mc) {
        return Double(i) * 5.2
    } else {
        return Double(i) * 5.0
    }
}

/* TODO later
struct VAstrologieTableau2Angles_Previews: PreviewProvider {
    static var previews: some View {
        VAstrologieTableau2Angles()
    }
}
*/
