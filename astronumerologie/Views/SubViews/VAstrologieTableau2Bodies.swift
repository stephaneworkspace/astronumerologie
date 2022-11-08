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
    let fix = -150.0
    let bodPos = CGFloat((300 / 2) * -1)
    let cas = Double(300) / 16.0
    let casDiv = 1.1
    
    //let yPos = bodPos + (cas / 2) + (cas * Double(i)) - fix
    var body: some View {
        let xPos = bodPos + (cas / 2) + (cas * Double(i)) - fix
        VStack {
            SVGView(contentsOf: try! swe.swec.asset_bodie(i: bodie.rawValue))
                .frame(width: 20.0, height: 20.0)
        }.frame(maxWidth: .infinity, alignment: .leading).offset(x: xPos, y: 0)
    }
}

/* TODO later
struct VAstrologieTableau2_Previews: PreviewProvider {
    static var previews: some View {
        VAstrologieTableau2Bodies()
    }
}
*/
