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
    @State var numerologie: NumerologieCore

    var body: some View {
        VStack {
            ETitleData(sL: sL, numerologie: numerologie)
            EDatePicker(bdNatal: $bdNatal, numerologie: numerologie, sL: sL)
            ENamesTextField(
                    sL: sL,
                    numerologie: numerologie,
                    ssFirstName: bsFirstName,
                    ssSecondName: bsSecondName,
                    ssThirdName: bsThirdName,
                    ssLastName1: bsLastName1,
                    ssLastName2: bsLastName2,
                    ssLastName3: bsLastName3
            )
            ETitleLocalisation(sL: sL, numerologie: numerologie)
            ELocalisationTextField(bdLat: $bdLat, bdLng: $bdLng, biTimeZone: $biTimeZone, sL: sL, numerologie: numerologie)
        }
    }
}
