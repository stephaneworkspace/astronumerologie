//
//  VAstrologie.swift
//  astronumerologie
//
//  Created by Stéphane on 02.11.22.
//

import SwiftUI
import SweBressaniDev

struct VAstrologie: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Binding var swe: SweCore
    @Binding var swBodies: [Bool]
    @State var bodiesForLoop: [SweCore.Bodies]

    var body: some View {
        ZStack {
            VAstrologieZodiac(swe: $swe)
            ForEach(1...12, id: \.self)  { i in
                VAstrologieAssetSigns(swe: $swe, sign: i)
            }
            ForEach(1...4, id: \.self) { i in
                let angle = SweCore.Angles(rawValue: Int32(i))!
                VAstrologieAssetAngles(swe: $swe, angle: angle)
                VAstrologieAngles(swe: $swe, angle: angle)
            }
            VAstrologieHouses(swe: $swe)
            ForEach(1...12, id: \.self)  { i in
                VAstrologieAssetHouses(swe: $swe, house: i)
            }
            //
            ForEach(Array(zip(bodiesForLoop.indices, bodiesForLoop)), id: \.1) { i, b in
                if (swBodies[i]) {
                    VAstrologieBodies(swe: $swe, bodie: b, swTransit: false)
                    VAstrologieBodies(swe: $swe, bodie: b, swTransit: true)
                    VAstrologieAssetBodies(swe: $swe, bodie: b, swTransit: false)
                    VAstrologieAssetBodies(swe: $swe, bodie: b, swTransit: true)
                }
            }
        }
        // Tableau 1
        VStack(spacing: 0) {
            ForEach(Array(zip(bodiesForLoop.indices, bodiesForLoop)), id: \.1) { i, b in
                if (swBodies[i]) {
                    VAstrologieTableau1(swe: $swe, bodie: b, swTransit: false)
                }
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
