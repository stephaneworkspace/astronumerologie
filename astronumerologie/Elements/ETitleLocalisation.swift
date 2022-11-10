//
// Created by Stéphane on 06.09.22.
//

import Foundation
import SwiftUI
import SweBressaniDev

struct ETitleLocalisation: View {
    @State var sL: L
    @State var text: TextCore

    var body: some View {
        HStack {
            Text("\(text.localisation())")
            Spacer()
        }
                .font(FONTSYSTEM)
                .clipped()
    }
}
