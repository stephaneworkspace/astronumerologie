//
// Created by Stéphane on 05.09.22.
//

import Foundation
import SwiftUI
import SweBressaniDev

struct EDatePicker: View {
    @Binding var bdNatal: Date
    @State var numerologie: NumerologieCore
    @State var sL: L

    var body: some View {
        VStack {
            DatePicker("\(numerologie.birthDate())",
                    selection: $bdNatal,
                    displayedComponents: [.date, .hourAndMinute]
            )
                    .font(FONTSYSTEM)
                    .clipped()
        }
    }
}
