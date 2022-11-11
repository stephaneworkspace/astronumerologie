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
    @Binding var bsSwe: SweCore
    @Binding var bbBodies: [Bool]

    var body: some View {
        ScrollView {
            VAstrologieChart(bsSwe: $bsSwe, baBodies: $bbBodies)
            VAstrologieTableau1(bsSwe: $bsSwe, saBodies: bbBodies)
            VAstrologieTableau2(bsSwe: $bsSwe, sbTransit1: false, sbTransit2: false)
            VStack{}.frame(height: 16 * 6)
            VAstrologieTableau2(bsSwe: $bsSwe, sbTransit1: true, sbTransit2: true)
            VStack{}.frame(height: 16 * 6)
            VAstrologieTableau2(bsSwe: $bsSwe, sbTransit1: false, sbTransit2: true)
            VStack{}.frame(height: 16 * 6)
        }
    }
}
