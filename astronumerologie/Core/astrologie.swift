//
//  astrologie.swift
//  astronumerologie
//
//  Created by Stéphane on 02.10.22.
//

import Foundation
import SwiftUI


struct AstroData {
    var y, m, d, hour, min: Int32
    var lat, lng: Double
    var tz: Int32
}

class Astrologie {
    var astro: AstroData
    
    init(natal: Date, lat: Double, lng: Double, tz: Int) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY"
        let y: Int32 = Int32(dateFormatter.string(from: natal)) ?? 1980
        dateFormatter.dateFormat = "MM"
        let m: Int32 = Int32(dateFormatter.string(from: natal)) ?? 1
        dateFormatter.dateFormat = "dd"
        let d: Int32 = Int32(dateFormatter.string(from: natal)) ?? 1
        dateFormatter.dateFormat = "hh"
        let hour: Int32 = Int32(dateFormatter.string(from: natal)) ?? 1
        dateFormatter.dateFormat = "mm"
        let min: Int32 = Int32(dateFormatter.string(from: natal)) ?? 1
        self.astro = AstroData(y: y, m: m, d: d, hour: hour, min: min, lat: lat, lng: lng, tz: Int32(tz))
    }
    
    func create_png() -> URL {
        let ta = theme_astral(self.astro.y,
                              self.astro.m,
                              self.astro.d,
                              self.astro.hour,
                              self.astro.min,
                              self.astro.lat,
                              self.astro.lng,
                              self.astro.tz);
        let svg: String = String(cString: UnsafePointer<CChar>(ta.b_64))
        let svg_p = svg.toUnsafePointer()
        
        // TODO catch expetion
        //let err: String = String(cString: UnsafePointer<CChar>(create_pdf_b64(svg_p).err))
        //print("Erreur " + err)
        
        let base64String: String = String(cString: UnsafePointer<CChar>(create_png_b64(svg_p).b_64))
        guard
            var documentsURL = (FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)).last,
            let convertedData = Data(base64Encoded: base64String)
        else {
            //handle error when getting documents URL
            // TODO pdf d'erreur
            let url = Bundle.main.url(forResource: "cfc", withExtension: "pdf")!
            return url
        }
        documentsURL.appendPathComponent("astrologie.png")
        do {
            try convertedData.write(to: documentsURL)
        } catch {
            //handle write error here
            // TODO pdf d'erreur
        }
        return documentsURL.absoluteURL
    }
    
    func print() {
        let ta = theme_astral(self.astro.y,
                              self.astro.m,
                              self.astro.d,
                              self.astro.hour,
                              self.astro.min,
                              self.astro.lat,
                              self.astro.lng,
                              self.astro.tz);
        let svg: String = String(cString: UnsafePointer<CChar>(ta.b_64))
        

        
        let printInfo = UIPrintInfo(dictionary: nil)
        printInfo.outputType = UIPrintInfo.OutputType.general
        printInfo.jobName = "Theme astral"
        
        let pdfFileData = try! Data(contentsOf: Astrologie.svgToPdfURL(svg: svg))
        
        do {
            sleep(2)
        }
        
        let printController = UIPrintInteractionController.shared
        printController.printInfo = printInfo
        printController.printingItem = pdfFileData
        printController.present(animated: true, completionHandler: nil)
    }
    
    static func svgToPdfURL(svg: String) -> URL {
        let svg_p = svg.toUnsafePointer()
        
        // TODO catch expetion
        //let err: String = String(cString: UnsafePointer<CChar>(create_pdf_b64(svg_p).err))
        //print("Erreur " + err)
        
        let base64String: String = String(cString: UnsafePointer<CChar>(create_pdf_b64(svg_p).b_64))
        guard
            var documentsURL = (FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)).last,
            let convertedData = Data(base64Encoded: base64String)
        else {
            //handle error when getting documents URL
            // TODO pdf d'erreur
            let url = Bundle.main.url(forResource: "cfc", withExtension: "pdf")!
            return url
        }
        documentsURL.appendPathComponent("astrologie.pdf")
        do {
            try convertedData.write(to: documentsURL)
        } catch {
            //handle write error here
            // TODO pdf d'erreur
        }
        return documentsURL.absoluteURL
    }
}
