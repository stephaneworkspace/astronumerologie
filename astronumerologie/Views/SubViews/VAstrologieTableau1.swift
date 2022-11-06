//
//  VAstrologieTableau1.swift
//  astronumerologie
//
//  Created by Stéphane on 06.11.22.
//

import SwiftUI
import SweBressaniDev
import SVGView

extension SweCore.Bodies {
    func bodieSign(swe: SweCore, swTransit: Bool) -> Int {
        var res = 1
        if (!swTransit) {
            // Natal
            for b in swe.swec.bodiesNatal {
                if b.bodie == self.rawValue {
                    for s in 1...12 {
                        var pos = Double(s - 1) * 30.0
                        if pos > 360 {
                            pos = 360 - pos
                        }
                        if b.calc_ut.longitude >= pos && b.calc_ut.longitude <= pos + 30 {
                            res = s
                            break
                        }
                    }
                }
            }
        } else {
            // Transit
            for b in swe.swec.bodiesTransit {
                if b.bodie == self.rawValue {
                    for s in 1...12 {
                        var pos = Double(s - 1) * 30.0
                        if pos > 360 {
                            pos = 360 - pos
                        }
                        if b.calc_ut.longitude >= pos && b.calc_ut.longitude <= pos + 30 {
                            res = s
                            break
                        }
                    }
                }
            }
        }
        return res
    }
}

struct VAstrologieTableau1: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Binding var swe: SweCore
    @State var bodie: SweCore.Bodies
    @State var swTransit: Bool

    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack {
                SVGView(contentsOf: try! swe.swec.asset_bodie(i: bodie.rawValue))
                    .frame(width: 20.0, height: 20.0)
            }.frame(maxWidth: .infinity, alignment: .leading).offset(x: 5, y: 0)
            VStack {
                Text(swe.swec.text_bodie(i: bodie.rawValue))
            }.frame(maxWidth: .infinity, alignment: .leading).offset(x: 30)
            VStack {
                SVGView(contentsOf: try! swe.swec.asset_sign(i: bodie.bodieSign(swe: swe, swTransit: false)))
                    .frame(width: 20.0, height: 20.0)
            }.frame(maxWidth: .infinity, alignment: .leading).offset(x: 180, y: 0)
            VStack {
                SVGView(contentsOf: try! swe.swec.asset_sign(i: bodie.bodieSign(swe: swe, swTransit: true)))
                    .frame(width: 20.0, height: 20.0)
            }.frame(maxWidth: .infinity, alignment: .leading).offset(x: 280, y: 0)
        }
    }
}

/* TODO later
struct VAstrologieTableau1_Previews: PreviewProvider {
    static var previews: some View {
        VAstrologieTableau1()
    }
}
*/
