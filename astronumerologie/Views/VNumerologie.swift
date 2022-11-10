//
// Created by Stéphane on 10.09.22.
//

import Foundation
import SwiftUI
import SweBressaniDev
import WebKit
import PDFKit

struct VNumerologie: View {
    @Binding var bdNatal: Date
    @Binding var bsFirstName: String
    @Binding var bsSecondName: String
    @Binding var bsThirdName: String
    @Binding var bsLastName1: String
    @Binding var bsLastName2: String
    @Binding var bsLastName3: String
    @State var numerologie: NumerologieCore
    @State var sL: L

    var body: some View {
        ScrollView {
            VStack {
                ETitleNumerologie(sL: sL)
                //EDatePicker(bdNatal: $bdNatal, sL: sL)
                VStack {
                    HStack {
                        Text("\(numerologie.born())")
                        Spacer()
                        Text("\(String(load(dBornDate: bdNatal)))")
                    }
                    HStack {
                        Text("\(LAge(L: sL))")
                        Spacer()
                        Text("\(String(age(dBornDate: bdNatal)))")
                    }
                    HStack {
                        Text("\(LLifePath(L: sL))")
                        Spacer()
                        Text("\(cheminDeVie(dBornDate: bdNatal))")
                    }
                }
                Spacer()
                VStack {
                    Text("Cycle adjacents")
                            .multilineTextAlignment(.center)
                            .font(FONTSYSTEMTITLEMEDIUM)
                            .clipped()
                    HStack {
                        TextField("", text: .constant("\(LCycle(L: sL))"))
                                .disabled(true)
                                .textFieldStyle(.plain)
                                .multilineTextAlignment(.leading)
                                .clipped()
                        Spacer()
                        TextField("", text: .constant("\(LCalcul(L: sL))"))
                                .disabled(true)
                                .textFieldStyle(.plain)
                                .multilineTextAlignment(.center)
                                .clipped()
                        Spacer()
                        TextField("", text: .constant("\(LNombre(L: sL))"))
                                .disabled(true)
                                .textFieldStyle(.plain)
                                .multilineTextAlignment(.trailing)
                                .clipped()
                    }
                            .font(FONTSYSTEM)
                            .clipped()
                    HStack {
                        TextField("", text: .constant("Formatif"))
                                .disabled(true)
                                .textFieldStyle(.plain)
                                .multilineTextAlignment(.leading)
                                .clipped()
                        Spacer()
                        TextField("", text: .constant("Mois"))
                                .disabled(true)
                                .textFieldStyle(.plain)
                                .multilineTextAlignment(.center)
                                .clipped()
                        Spacer()
                        TextField("", text: .constant(cycleAdjacents(dBornDate: bdNatal, eCycle: .Formatif)))
                                .disabled(true)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .multilineTextAlignment(.trailing)
                                .clipped()
                    }
                            .font(FONTSYSTEMSMALL)
                            .clipped()
                    HStack {
                        TextField("", text: .constant("Productif"))
                                .disabled(true)
                                .textFieldStyle(.plain)
                                .multilineTextAlignment(.leading)
                                .clipped()
                        Spacer()
                        TextField("", text: .constant("Jour"))
                                .disabled(true)
                                .textFieldStyle(.plain)
                                .multilineTextAlignment(.center)
                                .clipped()
                        Spacer()
                        TextField("", text: .constant(cycleAdjacents(dBornDate: bdNatal, eCycle: .Productif)))
                                .disabled(true)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .multilineTextAlignment(.trailing)
                                .clipped()
                    }
                            .font(FONTSYSTEMSMALL)
                            .clipped()
                    HStack {
                        TextField("", text: .constant("Moisson"))
                                .disabled(true)
                                .textFieldStyle(.plain)
                                .multilineTextAlignment(.leading)
                                .clipped()
                        Spacer()
                        TextField("", text: .constant("Année"))
                                .disabled(true)
                                .textFieldStyle(.plain)
                                .multilineTextAlignment(.center)
                                .clipped()
                        Spacer()
                        TextField("", text: .constant(cycleAdjacents(dBornDate: bdNatal, eCycle: .Moisson)))
                                .disabled(true)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .multilineTextAlignment(.trailing)
                                .clipped()
                    }
                            .font(FONTSYSTEMSMALL)
                            .clipped()
                }
            }
            VStack {
                Text("\(LCycleRealisation(L: sL))").multilineTextAlignment(.center)
                        .font(FONTSYSTEMTITLEMEDIUM)
                        .clipped()
                HStack {
                    TextField("", text: .constant("Age de à"))
                            .disabled(true)
                            .textFieldStyle(.plain)
                            .multilineTextAlignment(.leading)
                            .clipped()
                    Spacer()
                    TextField("", text: .constant("Calcul"))
                            .disabled(true)
                            .multilineTextAlignment(.center)
                            .clipped()
                    Spacer()
                    TextField("", text: .constant("\(LNombre(L: sL))"))
                            .disabled(true)
                            .textFieldStyle(.plain)
                            .multilineTextAlignment(.trailing)
                            .clipped()
                }
                        .font(FONTSYSTEM)
                        .clipped()
                VStack {
                    HStack {
                        TextField("", text: .constant(LCycleRealisation(L: sL, iLivePath: cheminDeVieInt(dBornDate: bdNatal), eCycle: .JplusM)))
                                .disabled(true)
                                .textFieldStyle(.plain)
                                .multilineTextAlignment(.leading)
                                .clipped()
                        Spacer()
                        TextField("", text: .constant("J + M"))
                                .disabled(true)
                                .textFieldStyle(.plain)
                                .multilineTextAlignment(.center)
                                .clipped()
                        Spacer()
                        TextField("", text: .constant(jPlusMInt(dBornDate: bdNatal)))
                                .disabled(true)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .multilineTextAlignment(.trailing)
                                .clipped()
                    }
                    HStack {
                        TextField("", text: .constant(LCycleRealisation(L: sL, iLivePath: cheminDeVieInt(dBornDate: bdNatal), eCycle: .JplusA)))
                                .disabled(true)
                                .textFieldStyle(.plain)
                                .multilineTextAlignment(.leading)
                                .clipped()
                        Spacer()
                        TextField("", text: .constant("J + A"))
                                .disabled(true)
                                .textFieldStyle(.plain)
                                .multilineTextAlignment(.center)
                                .clipped()
                        Spacer()
                        TextField("", text: .constant(jPlusAInt(dBornDate: bdNatal)))
                                .disabled(true)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .multilineTextAlignment(.trailing)
                                .clipped()
                    }
                    HStack {
                        TextField("", text: .constant(LCycleRealisation(L: sL, iLivePath: cheminDeVieInt(dBornDate: bdNatal), eCycle: .UnplusDeux)))
                                .disabled(true)
                                .textFieldStyle(.plain)
                                .multilineTextAlignment(.leading)
                                .clipped()
                        Spacer()
                        TextField("", text: .constant("1 + 2"))
                                .disabled(true)
                                .textFieldStyle(.plain)
                                .multilineTextAlignment(.center)
                                .clipped()
                        Spacer()
                        TextField("", text: .constant(unPlusDeuxInt(dBornDate: bdNatal)))
                                .disabled(true)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .multilineTextAlignment(.trailing)
                                .clipped()
                    }
                    HStack {
                        TextField("", text: .constant(LCycleRealisation(L: sL, iLivePath: cheminDeVieInt(dBornDate: bdNatal), eCycle: .MplusA)))
                                .disabled(true)
                                .textFieldStyle(.plain)
                                .multilineTextAlignment(.leading)
                                .clipped()
                        Spacer()
                        TextField("", text: .constant("M + A"))
                                .disabled(true)
                                .textFieldStyle(.plain)
                                .multilineTextAlignment(.center)
                                .clipped()
                        Spacer()
                        TextField("", text: .constant(mPlusAInt(dBornDate: bdNatal)))
                                .disabled(true)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .multilineTextAlignment(.trailing)
                                .clipped()
                    }
                }
                        .font(FONTSYSTEMSMALL)
                        .clipped()
            }
            VStack {
                Text("\(LCycleUniversels(L: sL))")
                        .multilineTextAlignment(.center)
                        .font(FONTSYSTEMTITLEMEDIUM)
                        .clipped()
                HStack {
                    TextField("", text: .constant("\(LAgeDe(L: sL))"))
                            .disabled(true)
                            .textFieldStyle(.plain)
                            .multilineTextAlignment(.leading)
                            .clipped()
                    Spacer()
                    TextField("", text: .constant("\(LNombre(L: sL))"))
                            .disabled(true)
                            .textFieldStyle(.plain)
                            .multilineTextAlignment(.trailing)
                            .clipped()
                }
                        .font(FONTSYSTEM)
                        .clipped()
                ForEach(1...9, id: \.self) { idx in
                    HStack {
                        TextField("", text: .constant(LCycleUniversel(L: sL, iNombre: idx)))
                                .disabled(true)
                                .textFieldStyle(.plain)
                                .multilineTextAlignment(.leading)
                                .clipped()
                        Spacer()
                        TextField("", text: .constant(String(idx)))
                                .disabled(true)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .multilineTextAlignment(.trailing)
                                .clipped()
                    }
                            .font(FONTSYSTEMSMALL)
                            .clipped()
                }
            }
            Button(action: {
                fPrint(sL: sL, dBornDate: bdNatal)
            }, label: {

                VStack {
                    Text("Imprimer")
                            .padding()
                            .foregroundColor(.black)
                            .background(Color.white)
                            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.3), radius: 10, x: 0, y: 10)
                            .padding()
                            .frame(maxWidth: 300)

                }
            })
            /*
            Button(action: {
                fMd(sL: sL, dBornDate: bdNatal)
            }, label: {

                VStack {
                    Text("Imprimer2")
                            .padding()
                            .foregroundColor(.black)
                            .background(Color.white)
                            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.3), radius: 10, x: 0, y: 10)
                            .padding()
                            .frame(maxWidth: 300)

                }
            })*/
            Spacer()
        }
    }
}

struct Cycle: Identifiable {
    let sCycle: String
    let sCalcul: String
    let sNumber: String
    let id = UUID()
}

/*
func fMd(sL: L, dBornDate: Date) {
    let file: String = writeMdNumerologie(sL: sL, dBornDate: dBornDate)
    let base64String = String(cString: UnsafePointer<CChar>(md_to_b64(file).b_64))
    let pdfFileData = Data(base64Encoded: base64String)
    let printInfo = UIPrintInfo(dictionary: nil)
    printInfo.outputType = UIPrintInfo.OutputType.general
    printInfo.jobName = "Numérologie"
    let printController = UIPrintInteractionController.shared
    printController.printInfo = printInfo
    printController.printingItem = pdfFileData
    printController.present(animated: true, completionHandler: nil)
}*/


func fPrint(sL: L, dBornDate: Date) {
    let printingView = UIHostingController(rootView: ContentView()).view

    let html: String = printNumerologie(sL: sL, dBornDate: dBornDate)

    let fmt = UIMarkupTextPrintFormatter(markupText: html)
    
    // 2. Assign print formatter to UIPrintPageRenderer
    let render = UIPrintPageRenderer()
    
    render.addPrintFormatter(fmt, startingAtPageAt: 0)
    
    // 3. Assign paperRect and printableRect
    let page = CGRect(x: 0, y: 0, width: 595.2, height: 841.8) // A4, 72 dpi
    let printable = page.insetBy(dx: 0, dy: 0)

    render.setValue(NSValue(cgRect: page), forKey: "paperRect")
    render.setValue(NSValue(cgRect: printable), forKey: "printableRect")

    // 4. Create PDF context and draw

    let pdfData = NSMutableData()
    UIGraphicsBeginPDFContextToData(pdfData, .zero, nil)

    for i in 1...render.numberOfPages {
        UIGraphicsBeginPDFPage();
        let bounds = UIGraphicsGetPDFContextBounds()
        render.drawPage(at: i - 1, in: bounds)
    }
    UIGraphicsEndPDFContext();


    // SETUP PRINT INFO
    let printInfo = UIPrintInfo(dictionary: nil)
    printInfo.outputType = UIPrintInfo.OutputType.general
    printInfo.jobName = "Print Job"
    printInfo.orientation = .portrait

    // SETUP PRINT CONTROLLER
    let printController = UIPrintInteractionController.shared
    printController.printInfo = printInfo
    printController.showsNumberOfCopies = true
    printController.showsPaperSelectionForLoadedPapers = true
    printController.printingItem = pdfData
    printController.present(animated: true, completionHandler: nil)
}

