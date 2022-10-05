//
//  Chart.swift
//  astronumerologie
//
//  Created by Stéphane on 05.10.22.
//

import Foundation

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


