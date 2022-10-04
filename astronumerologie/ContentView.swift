//
//  ContentView.swift
//  astronumerologie
//
//  Created by Stéphane on 03.09.22.
//

import SwiftUI

extension String {
    func toUnsafePointer() -> UnsafePointer<UInt8>? {
        guard let data = self.data(using: .utf8) else {
            return nil
        }

        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: data.count)
        let stream = OutputStream(toBuffer: buffer, capacity: data.count)
        stream.open()
        let value = data.withUnsafeBytes {
            $0.baseAddress?.assumingMemoryBound(to: UInt8.self)
        }
        guard let val = value else {
            return nil
        }
        stream.write(val, maxLength: data.count)
        stream.close()

        return UnsafePointer<UInt8>(buffer)
    }

    func toUnsafeMutablePointer() -> UnsafeMutablePointer<Int8>? {
        return strdup(self)
    }
}

struct ContentView: View {
    @State private var siSelected: Int = 1
    @State private var sdNatal: Date = Date()
    @State var ssFirstName: String = "Stéphane"
    @State var ssSecondName: String = "Thomas"
    @State var ssThirdName: String = ""
    @State var ssLastName1: String = "Bressani"
    @State var ssLastName2: String = "Pedroli"
    @State var ssLastName3: String = ""
    @State private var bdLat: Double = 46.12
    @State private var bdLng: Double = 6.09
    @State private var biTimeZone: Int = 2
    @State var sL: L = .F
    @State var sAstro: Astrologie = Astrologie(natal: Date(),lat: 0, lng: 0, tz: 0)
    @State private var sInputImageAstro: UIImage?
    @State var sImageAstro: Image?
    
    var body: some View {
        VStack {
            TabView(selection: $siSelected.onUpdate {
                if siSelected == 3 {
                    sAstro = Astrologie(natal: sdNatal, lat: bdLat, lng: bdLng, tz: biTimeZone)
                    let url = sAstro.create_png()
                    sInputImageAstro = UIImage(contentsOfFile: url.path)
                    guard let sInputImageAstro = sInputImageAstro else { return }
                    sImageAstro = Image(uiImage: sInputImageAstro)
                }
            }) {
                VStack {
                    VInput(
                        bdNatal: $sdNatal,
                        bsFirstName: $ssFirstName,
                        bsSecondName: $ssSecondName,
                        bsThirdName: $ssThirdName,
                        bsLastName1: $ssLastName1,
                        bsLastName2: $ssLastName2,
                        bsLastName3: $ssLastName3,
                        bdLat: $bdLat,
                        bdLng: $bdLng,
                        biTimeZone: $biTimeZone,
                        sL: sL)
                }
                .padding()
                .tabItem {
                    VStack {
                        Image(systemName: "person")
                        Text("Données")
                    }
                }
                .tag(1)
                VStack {
                    VNumerologie(
                            bdNatal: $sdNatal,
                            bsFirstName: $ssFirstName,
                            bsSecondName: $ssSecondName,
                            bsThirdName: $ssThirdName,
                            bsLastName1: $ssLastName1,
                            bsLastName2: $ssLastName2,
                            bsLastName3: $ssLastName3,
                            sL: sL)
                }
                .padding()
                .tabItem {
                    VStack {
                        Image(systemName: "plus")
                        Text("Numérologie")
                    }
                    
                }
                .tag(2)
                VStack {
                    Text("Astrologie")
                    if sImageAstro != nil {
                        sImageAstro?
                            .resizable()
                            .scaledToFit()
                    } else {
                    }
                    Button(action: {
                        print("Print button tapped!")
                        //let versionPtr = UnsafeMutablePointer<Int8>.allocate(capacity: 255)
                        //let res = String.init(cString: swe_version(versionPtr)) as String
                        //free(versionPtr)
                        //print(res)
                        sAstro.print()
                    }) {
                        Image(systemName: "printer")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                    }
                }
                .padding()
                .tabItem {
                    VStack {
                        Image(systemName: "plus")
                        Text("Astrologie")
                    }
                    
                }
                .tag(3)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func load(dBornDate: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "YYYY"
    let iYear = Int(dateFormatter.string(from: dBornDate)) ?? 1980
    dateFormatter.dateFormat = "MM"
    let iMonth = Int(dateFormatter.string(from: dBornDate)) ?? 1
    dateFormatter.dateFormat = "dd"
    let iDay = Int(dateFormatter.string(from: dBornDate)) ?? 1
    dateFormatter.dateFormat = "hh"
    let iHour = Int(dateFormatter.string(from: dBornDate)) ?? 0
    dateFormatter.dateFormat = "mm"
    let iMin = Int(dateFormatter.string(from: dBornDate)) ?? 0
    return String(iDay) + "." + String(iMonth) + "." + String(iYear)
}

extension Binding {
    func onUpdate(_ closure: @escaping () -> Void) -> Binding<Value> {
        Binding(get: {
            wrappedValue
        }, set: { newValue in
            wrappedValue = newValue
            closure()
        })
    }
}
