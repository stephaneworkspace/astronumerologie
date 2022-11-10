//
// Created by Stéphane on 10.09.22.
//

import Foundation
import SwiftUI
import SweBressaniDev

struct ETitleNumerologie: View {
    @State var sL: L
    @State var text: TextCore

    var body: some View {
        HStack {
            Image(systemName: "plus")
                    .imageScale(IMAGESCALE)
                    .foregroundColor(FOREGROUNDCOLOR)
            Text("\(text.numerologie())")
                    .font(FONTSYSTEMTITLEMEDIUM)
                    .clipped()
            Spacer()
        }
                .font(FONTSYSTEMTITLE)
                .clipped()
    }
}
