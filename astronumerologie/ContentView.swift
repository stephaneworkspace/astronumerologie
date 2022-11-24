//
//  ContentView.swift
//  astronumerologie
//
//  Created by Stéphane on 03.09.22.
//

import SwiftUI
import SweBressaniDev
import Zip

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
    @State private var swe: SweCore = SweCore(pathEphe: try! Zip.quickUnzipFile(Bundle.main.url(forResource: "ephem", withExtension: "zip")!).absoluteString, size: 400)
    @State private var stText: TextCore = TextCore(langue: .F)
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
        false
    ]

    var body: some View {
        VStack {
            TabView(selection: $siSelected.onUpdate {
                if siSelected == 3 {
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
                        stText: stText)
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
                            stText: stText)
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
                    VAstrologie(bsSwe: $swe, bbBodies: $swBodies)
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
                    VSelection(bsSwe: $swe, baBodies: $swBodies)
                }
                .padding()
                .tabItem {
                    VStack {
                        Image(systemName: "switch.2")
                        Text("Sélection planètes")
                    }
                    
                }
                .tag(4)
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

            
            let data: Data
            let filename = "save.json"
            // Check that the fileExists in the documents directory
            let filemanager = FileManager.default
            let localPath = getDocumentsDirectory().appendingPathComponent(filename)

            if filemanager.fileExists(atPath: localPath.path) {
                do {
                    data = try Data(contentsOf: localPath)
                } catch {
                    fatalError("Couldn't load save.json from documents directory:\n\(error)")
                }
                do {
                    let decoder = JSONDecoder()
                    decode = try decoder.decode(Chart.self, from: data)
                } catch {
                    fatalError("Couldn't parse \(filename) as Swe.Chart.self:\n\(error)")
                }
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

struct Chart: Codable {
    let nLat: Double
    let nLng: Double
    let nTimeZone: Int32
    let nYear: Int32
    let nMonth: Int32
    let nDay: Int32
    let nHour: Int32
    let nMin: Int32
    let tLat: Double
    let tLng: Double
    let tTimeZone: Int32
    let tYear: Int32
    let tMonth: Int32
    let tDay: Int32
    let tHour: Int32
    let tMin: Int32
}

func saveChart(chart: Chart) {
    do {
        let encoded = try JSONEncoder().encode(chart)
        let jsonString = String(data: encoded, encoding: .utf8)
        let url = getDocumentsDirectory().appendingPathComponent("save.json")
        try jsonString?.write(to: url, atomically: true, encoding: .utf8)
    } catch {
        print("Unable to open chart file")
    }
}

// Read JSON directory
func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    // Check that the fileExists in the documents directory
    let filemanager = FileManager.default
    let localPath = getDocumentsDirectory().appendingPathComponent(filename)

    if filemanager.fileExists(atPath: localPath.path) {

        do {
            data = try Data(contentsOf: localPath)
        } catch {
            fatalError("Couldn't load \(filename) from documents directory:\n\(error)")
        }

    } else {
        // If the file doesn't exist in the documents directory load it from the bundle
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
                else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }

        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
    }


    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}


