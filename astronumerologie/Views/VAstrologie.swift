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

    var body: some View {
        ScrollView {
            VAstrologieChart(bsSwe: $swe, baBodies: $swBodies)
            VAstrologieTableau1(bsSwe: $swe, saBodies: swBodies)
            // Tableau 2
            VAstrologieTableau2(swe: $swe, swTransit1: false, swTransit2: false)
            VStack{}.frame(height: 16 * 6)
            VAstrologieTableau2(swe: $swe, swTransit1: true, swTransit2: true)
            VStack{}.frame(height: 16 * 6)
            VAstrologieTableau2(swe: $swe, swTransit1: false, swTransit2: true)
            VStack{}.frame(height: 16 * 6)
        }
    }
}

func countTableau2(bodiesForLoop: [SweCore.Bodies], swBodies: [Bool]) -> Int {
    var j = 0
    for (i, _) in bodiesForLoop.enumerated() {
        if swBodies[i] {
            j += 1
        }
    }
    return j
}

/* // TODO
struct VAstrologie_Previews: PreviewProvider {
    static var previews: some View {
        VAstrologie()
    }
}
*/
