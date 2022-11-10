//
// Created by Stéphane on 05.09.22.
//

import Foundation
import SwiftUI
import SweBressaniDev

struct ETitleData: View {
    @State var sL: L
    @State var text: TextCore

    var body: some View {
        HStack {
            Image(systemName: "person")
                    .imageScale(IMAGESCALE)
                    .foregroundColor(FOREGROUNDCOLOR)
            Text("\(text.data())")
                    .font(FONTSYSTEMTITLEMEDIUM)
                    .clipped()
            Spacer()
        }
                .font(FONTSYSTEMTITLE)
                .clipped()
    }
}
