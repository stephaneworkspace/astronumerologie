//
// Created by Stéphane on 05.09.22.
//

import Foundation
import SwiftUI
import SweBressaniDev

struct ENamesTextField: View {
    @State var sL: L
    @State var numerologie: NumerologieCore
    @State var ssFirstName: String
    @State var ssSecondName: String
    @State var ssThirdName: String
    @State var ssLastName1: String
    @State var ssLastName2: String
    @State var ssLastName3: String

    var body: some View {
        VStack {
            HStack {
                Text("\(numerologie.firstName())")
                        .font(FONTSYSTEM)
                        .clipped()
                Spacer()
            }
            TextField("\(numerologie.firstName())", text: $ssFirstName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("\(numerologie.secondName())", text: $ssSecondName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("\(numerologie.thirdName())", text: $ssThirdName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            HStack {
                Text("\(numerologie.lastName())")
                        .font(FONTSYSTEM)
                        .clipped()
                Spacer()
            }
            TextField("\(numerologie.lastName())", text: $ssLastName1)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("\(numerologie.lastNameAux())", text: $ssLastName2)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("\(numerologie.lastNameAux())", text: $ssLastName3)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
        }
                .font(FONTSYSTEM)
                .clipped()
    }
}
