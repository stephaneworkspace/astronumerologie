//
// Created by Stéphane on 05.09.22.
//

import Foundation
import SwiftUI

struct EDatePicker: View {
    @Binding var bdNatal: Date
    @State var sL: L

    var body: some View {
        VStack {
            DatePicker("\(LBirthDate(L: sL))",
                    selection: $bdNatal,
                    displayedComponents: [.date, .hourAndMinute]
            )
                    .font(FONTSYSTEM)
                    .clipped()
        }
    }
}