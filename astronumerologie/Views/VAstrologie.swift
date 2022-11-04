//
//  VAstrologie.swift
//  astronumerologie
//
//  Created by Stéphane on 02.11.22.
//

import SwiftUI


struct VAstrologie: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Binding var swe: Swe

    var body: some View {
        ZStack {
            VAstrologieZodiac(swe: $swe)
            ForEach(1...12, id: \.self)  { i in
                VAstrologieAssetSigns(swe: $swe, sign: i)
            }
            VAstrologieHouses(swe: $swe)
            ForEach(1...12, id: \.self)  { i in
                VAstrologieAssetHouses(swe: $swe, house: i)
            }
            //
            ForEach(swe.bodies, id: \.self) { i in
                VAstrologieBodies(swe: $swe, bodie: i, swTransit: false)
                VAstrologieBodies(swe: $swe, bodie: i, swTransit: true)
                VAstrologieAssetBodies(swe: $swe, bodie: i, swTransit: false)
                VAstrologieAssetBodies(swe: $swe, bodie: i, swTransit: true)
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
