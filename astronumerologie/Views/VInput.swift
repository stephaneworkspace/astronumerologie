//
// Created by Stéphane on 03.09.22.
//

import Foundation
import SwiftUI
import SweBressaniDev

struct VInput: View {
    @Binding var bdNatal: Date
    @Binding var bsFirstName: String
    @Binding var bsSecondName: String
    @Binding var bsThirdName: String
    @Binding var bsLastName1: String
    @Binding var bsLastName2: String
    @Binding var bsLastName3: String
    @Binding var bdLat: Double
    @Binding var bdLng: Double
    @Binding var biTimeZone: Int
    @State var sL: L
    @State var text: TextCore

    var body: some View {
        VStack {
            ETitleData(sL: sL, text: text)
            EDatePicker(bdNatal: $bdNatal, text: text, sL: sL)
            ENamesTextField(
                    sL: sL,
                    text: text,
                    ssFirstName: bsFirstName,
                    ssSecondName: bsSecondName,
                    ssThirdName: bsThirdName,
                    ssLastName1: bsLastName1,
                    ssLastName2: bsLastName2,
                    ssLastName3: bsLastName3
            )
            ETitleLocalisation(sL: sL, text: text)
            ELocalisationTextField(bdLat: $bdLat, bdLng: $bdLng, biTimeZone: $biTimeZone, sL: sL, text: text)
        }
    }
}
