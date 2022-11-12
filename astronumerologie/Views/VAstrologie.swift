//
//  VAstrologie.swift
//  astronumerologie
//
//  Created by Stéphane on 02.11.22.
//

import SwiftUI
import SweBressaniDev

struct VAstrologie: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Binding var bsSwe: SweCore
    @Binding var bbBodies: [Bool]

    var body: some View {
        ScrollView {
            VAstrologieChart(bsSwe: $bsSwe, baBodies: $bbBodies)
            VAstrologieTableau1(bsSwe: $bsSwe, saBodies: bbBodies)
            VAstrologieTableau2(bsSwe: $bsSwe, sbTransit1: false, sbTransit2: false)
            VStack{}.frame(height: 16 * 6)
            VAstrologieTableau2(bsSwe: $bsSwe, sbTransit1: true, sbTransit2: true)
            VStack{}.frame(height: 16 * 6)
            VAstrologieTableau2(bsSwe: $bsSwe, sbTransit1: false, sbTransit2: true)
            VStack{}.frame(height: 16 * 6)
            Button(action: {
                let printInfo = UIPrintInfo(dictionary: nil)
                printInfo.outputType = UIPrintInfo.OutputType.general
                printInfo.jobName = "Theme astral" // TODO
                let printController = UIPrintInteractionController.shared
                printController.printInfo = printInfo
                printController.printingItem = try! SweSvg.pdf(swe: bsSwe)
                printController.present(animated: true, completionHandler: nil)
            }, label: {
                VStack {
                    Text("Imprimer") // TODO
                            .padding()
                            .foregroundColor(.black)
                            .background(Color.white)
                            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.3), radius: 10, x: 0, y: 10)
                            .padding()
                            .frame(maxWidth: 300)
                }
            })
        }
    }
}
