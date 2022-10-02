//
// Created by Stéphane on 06.09.22.
//

import Foundation
import SwiftUI

struct ETitleLocalisation: View {
    @State var sL: L

    var body: some View {
        HStack {
            Text("\(LLocalisation(L: sL))")
            Spacer()
        }
                .font(FONTSYSTEM)
                .clipped()
    }
}
