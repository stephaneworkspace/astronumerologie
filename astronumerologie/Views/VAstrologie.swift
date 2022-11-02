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
                VAstrologieSigns(swe: $swe, sign: i)
            }
            VAstrologieHouses(swe: $swe)
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
