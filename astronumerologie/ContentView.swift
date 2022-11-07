//
//  ContentView.swift
//  astronumerologie
//
//  Created by Stéphane on 03.09.22.
//

import SwiftUI
import SweBressaniDev

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
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
    @State private var swe: SweCore = SweCore(pathEphe: "")
    @State private var swBodies: [Bool] = [
        true,
        true,
        true,
        true,
        true,
        true,
        true,
        true,
        true,
        true,
        true,
        false,
        false,
        false,
    ]
    @State private var bodiesForLoop: [SweCore.Bodies] = [
        SweCore.Bodies.Soleil,
        SweCore.Bodies.Lune,
        SweCore.Bodies.Mercure,
        SweCore.Bodies.Venus,
        SweCore.Bodies.Mars,
        SweCore.Bodies.Jupiter,
        SweCore.Bodies.Saturn,
        SweCore.Bodies.Uranus,
        SweCore.Bodies.Neptune,
        SweCore.Bodies.Pluto,
        SweCore.Bodies.NoeudLunaire,
        SweCore.Bodies.Chiron,
        SweCore.Bodies.Ceres,
        SweCore.Bodies.NoeudLunaireSud,
    ]

    var body: some View {
        VStack {
            TabView(selection: $siSelected.onUpdate {
                if siSelected == 3 {
                    sAstro = Astrologie(natal: sdNatal, lat: bdLat, lng: bdLng, tz: biTimeZone)
                    saveChart(chart: sAstro.chart())
                    do {
                        sleep (2)
                    }
                    let url = sAstro.create_png(natal: sdNatal, lat: bdLat, lng: bdLng, tz: Int32(biTimeZone), colorScheme: colorScheme)
                    sInputImageAstro = UIImage(contentsOfFile: url.path)
                    guard let sInputImageAstro = sInputImageAstro else { return } // TODO return ?
                    sImageAstro = Image(uiImage: sInputImageAstro)
                } else if siSelected == 4 {
                    /*
                    var bodies: [SweCore.Bodies] = []
                    for (i, b) in bodiesForLoop.enumerated() {
                        if swBodies[i] {
                            bodies.append(b)
                        }
                    }*/
                    self.swe.set(natal: sdNatal, transit: Date(), lat: bdLat, lng: bdLng, tz: Int32(biTimeZone), colorMode: colorScheme == .light ? .Light : .Dark)
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
                VStack {
                    VAstrologie(swe: $swe, swBodies: $swBodies, bodiesForLoop: bodiesForLoop)
                }
                .padding()
                .tabItem {
                    VStack {
                        Image(systemName: "plus")
                        Text("Astrologie")
                    }
                    
                }
                .tag(4)
                VStack {
                    VSelection(swe: $swe, swBodies: $swBodies, bodiesForLoop: bodiesForLoop)
                }
                .padding()
                .tabItem {
                    VStack {
                        Image(systemName: "switch.2")
                        Text("Sélection planètes")
                    }
                    
                }
                .tag(5)
            }
        }.onAppear {
            var decode: Chart = Chart.init(
                    nLat: 46.12,
                    nLng: 6.09,
                    nTimeZone: 2,
                    nYear: 1984,
                    nMonth: 1,
                    nDay: 1,
                    nHour: 0,
                    nMin: 0,
                    tLat: 46.12,
                    tLng: 6.09,
                    tTimeZone: 2,
                    tYear: 2022,
                    tMonth: 1,
                    tDay: 24,
                    tHour: 12,
                    tMin: 0)

            do {
                let data: Data
                let filename = "save.json"
                // Check that the fileExists in the documents directory
                let filemanager = FileManager.default
                let localPath = getDocumentsDirectory().appendingPathComponent(filename)

                if filemanager.fileExists(atPath: localPath.path) {
                    do {
                        do {
                            data = try Data(contentsOf: localPath)
                        } catch {
                            fatalError("Couldn't load save.json from documents directory:\n\(error)")
                        }
                    } catch {
                        fatalError("Couldn't load \(filename) from documents directory:\n\(error)")
                    }
                    //
                    do {
                        let decoder = JSONDecoder()
                        decode = try decoder.decode(Chart.self, from: data)
                    } catch {
                        fatalError("Couldn't parse \(filename) as Swe.Chart.self:\n\(error)")
                    }
                } else {
                    /*
                    // If the file doesn't exist in the documents directory load it from the bundle
                    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
                            else {
                        fatalError("Couldn't find \(filename) in main bundle.")
                    }
                    do {
                        data = try Data(contentsOf: file)
                    } catch {
                        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
                    }*/
                }


            } catch {
                do {
                    let path = Bundle.main.path(forResource: "data", ofType: "json")
                    let jsonData = try! String(contentsOfFile: path!).data(using: .utf8)!
                    decode = try JSONDecoder().decode(Chart.self, from: jsonData)
                } catch {
                    print("Unable to open chart file")
                }
                print("Unable to open saved chart file")
            }

            var dateN = DateComponents()
            dateN.year = Int(decode.nYear)
            dateN.month = Int(decode.nMonth)
            dateN.day = Int(decode.nDay)
            dateN.hour = Int(decode.nHour)
            dateN.minute = Int(decode.nMin)
            let calandarNatal = Calendar(identifier: .gregorian).date(from: dateN)
            self.sdNatal = calandarNatal.unsafelyUnwrapped

            var dateT = DateComponents()
            dateT.year = Int(decode.tYear)
            dateT.month = Int(decode.tMonth)
            dateT.day = Int(decode.tDay)
            dateT.hour = Int(decode.nHour)
            dateT.minute = Int(decode.nMin)
            let calandarTransit = Calendar(identifier: .gregorian).date(from: dateT)
            let _ = calandarTransit.unsafelyUnwrapped
            
            self.bdLat = Double(decode.nLat)
            self.bdLng = Double(decode.nLng)
            self.biTimeZone = Int(decode.nTimeZone)
            
            //self.sChart = decode
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
