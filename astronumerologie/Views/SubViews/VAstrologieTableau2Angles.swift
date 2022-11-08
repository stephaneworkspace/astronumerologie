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
        let xPos = bodPos + (cas / 2) + (cas * Double(i)) - fix
        VStack {
            SVGView(contentsOf: try! swe.swec.asset_angle(i: Int(angle.rawValue)))
                .frame(width: 20.0, height: 20.0)
        }.frame(maxWidth: .infinity, alignment: .leading).offset(x: xPos, y: 0)
    }
}

/* TODO later
struct VAstrologieTableau2Angles_Previews: PreviewProvider {
    static var previews: some View {
        VAstrologieTableau2Angles()
    }
}
*/
