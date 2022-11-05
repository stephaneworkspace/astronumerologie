//
//  VAstrologieHouses.swift
//  astronumerologie
//
//  Created by Stéphane on 02.11.22.
//

import SwiftUI
import SweBressaniDev

struct VAstrologieHouses: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Binding var swe: SweCore
    
    var body: some View {
        let colorStroke: Color = colorScheme == .light ? .black : .white
        VStack {
            DrawHouseTriangle(lines: swe.house_lines()).fill(colorStroke)
        }.frame(width: CGFloat(swe.size), height: CGFloat(swe.size))
        VStack {
            DrawHouseLine(lines: swe.house_lines()).stroke(colorStroke, lineWidth: 1.0)
        }.frame(width: CGFloat(swe.size), height: CGFloat(swe.size))
    }
}

/* TODO
struct VAstrologieHouses_Previews: PreviewProvider {
    static var previews: some View {
        VAstrologieHouses()
    }
}
*/
