//
// Created by Stéphane on 05.09.22.
//

import Foundation
import SwiftUI

struct ENamesTextField: View {
    @State var sL: L
    @State var ssFirstName: String
    @State var ssSecondName: String
    @State var ssThirdName: String
    @State var ssLastName1: String
    @State var ssLastName2: String
    @State var ssLastName3: String

    var body: some View {
        VStack {
            HStack {
                Text("\(LFirstName(L: sL))")
                        .font(FONTSYSTEM)
                        .clipped()
                Spacer()
            }
            TextField("\(LFirstName(L: sL))", text: $ssFirstName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("\(LSecondName(L: sL))", text: $ssSecondName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("\(LThirdName(L: sL))", text: $ssThirdName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            HStack {
                Text("\(LLastName(L: sL))")
                        .font(FONTSYSTEM)
                        .clipped()
                Spacer()
            }
            TextField("\(LLastName(L: sL))", text: $ssLastName1)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("\(LLastNameAux(L: sL))", text: $ssLastName2)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("\(LLastNameAux(L: sL))", text: $ssLastName3)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
        }
                .font(FONTSYSTEM)
                .clipped()
    }
}