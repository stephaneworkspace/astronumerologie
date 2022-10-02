//
// Created by Stéphane on 10.09.22.
//

import Foundation
import SwiftUI

struct ETitleNumerologie: View {
    @State var sL: L

    var body: some View {
        HStack {
            Image(systemName: "plus")
                    .imageScale(IMAGESCALE)
                    .foregroundColor(FOREGROUNDCOLOR)
            Text("\(LNumerologie(L: sL))")
                    .font(FONTSYSTEMTITLEMEDIUM)
                    .clipped()
            Spacer()
        }
                .font(FONTSYSTEMTITLE)
                .clipped()
    }
}
