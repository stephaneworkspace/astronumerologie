//
// Created by Stéphane on 05.09.22.
//

import Foundation
import SwiftUI

struct ETitleData: View {
    @State var sL: L

    var body: some View {
        HStack {
            Image(systemName: "person")
                    .imageScale(IMAGESCALE)
                    .foregroundColor(FOREGROUNDCOLOR)
            Text("\(LData(L: sL))")
                    .font(FONTSYSTEMTITLEMEDIUM)
                    .clipped()
            Spacer()
        }
                .font(FONTSYSTEMTITLE)
                .clipped()
    }
}
