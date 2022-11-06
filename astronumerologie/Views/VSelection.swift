//
//  VSelection.swift
//  astronumerologie
//
//  Created by Stéphane on 06.11.22.
//

import SwiftUI
import SweBressaniDev
import SVGView

struct VSelection: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Binding var swe: SweCore
    @Binding var swBodies: [Bool]
    @State var bodiesForLoop: [SweCore.Bodies]
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    HStack {
                    }.frame(height: 40) // TODO ok pour iphone11 les autres je ne sais pas
                    Spacer()
                    ForEach(Array(zip(bodiesForLoop.indices, bodiesForLoop)), id: \.1) { i, b in
                        HStack {
                            Toggle(swe.swec.text_bodie(i: b.rawValue), isOn: $swBodies[i])
                            GeometryReader { geometry in
                                SVGView(contentsOf: try! swe.swec.asset_bodie(i: b.rawValue))
                                    .frame(width: 25, height: 25)
                                    .padding()
                            }
                        }
                    }
                }
            }
        }
    }
}

/* TODO later
struct VSelection_Previews: PreviewProvider {
    static var previews: some View {
        VSelection()
    }
}
*/
