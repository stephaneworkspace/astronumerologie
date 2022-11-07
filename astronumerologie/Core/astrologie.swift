//
//  astrologie.swift
//  astronumerologie
//
//  Created by Stéphane on 02.10.22.
//

import Foundation
import SwiftUI
import Zip
import SweBressaniDev


struct AstroData {
    var y, m, d, hour, min: Int32
    var lat, lng: Double
    var tz: Int32
}

class Astrologie {
    var astro: AstroData
    var ephem: String
    var pngPath: String
    
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
        let filePath = Bundle.main.url(forResource: "ephem", withExtension: "zip")!
        do {
            let unzipDirectory = try Zip.quickUnzipFile(filePath) // Unzip
            let ephemPath: String = unzipDirectory.absoluteString
            self.ephem = ephemPath.replacingOccurrences(of: "file://", with: "")
        } catch {
            //TODO toast
            self.ephem = "" // Computed values
        }
        self.pngPath = ""
    }
    
    func chart() -> Chart {
        return Chart.init(nLat: self.astro.lat, nLng: self.astro.lng, nTimeZone: self.astro.tz, nYear: self.astro.y, nMonth: self.astro.m, nDay: self.astro.d, nHour: self.astro.hour, nMin: self.astro.min, tLat: self.astro.lat, tLng: self.astro.lng, tTimeZone: self.astro.tz, tYear: 2022, tMonth: 1, tDay: 1, tHour: 0, tMin: 0)
    }
    
    func create_png(natal: Date, lat: Double, lng: Double, tz: Int32, colorScheme: ColorScheme) -> URL {
        
        /*let svg: String = String(cString: UnsafePointer<CChar>(theme_astral_svg(self.astro.y,
                                                                                self.astro.m,
                                                                                self.astro.d,
                                                                                self.astro.hour,
                                                                                self.astro.min,
                                                                                self.astro.lat,
                                                                                self.astro.lng,
                                                                                self.astro.tz,
                                                                                self.ephem)))
        */
        // self.astro.natal etc... // TODO et remove la func
        var sweSvg = SweSvg(ephemPath: self.ephem)
        sweSvg.set(natal: natal, transit: natal, lat: lat, lng: lng, tz: tz, colorMode: colorScheme == .light ? .Light : .Dark) // TODO
        let svg = try! sweSvg.theme_astral()
        
        let base64String = String(cString: UnsafePointer<CChar>(create_png_from_file(svg).b_64))
        
        //let svg_p = svg.toUnsafePointer()
        
        // TODO catch expetion
        //let err: String = String(cString: UnsafePointer<CChar>(create_pdf_b64(svg_p).err))
        //print("Erreur " + err)
        
        //let base64String: String = String(cString: UnsafePointer<CChar>(create_png_b64(svg_p).b_64))
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
        let png_file = documentsURL.absoluteString
        self.pngPath = png_file.replacingOccurrences(of: "file://", with: "")
        return documentsURL.absoluteURL
    }
    
    /*
    func create_png2() -> URL {
        let ta = theme_astral(self.astro.y,
                              self.astro.m,
                              self.astro.d,
                              self.astro.hour,
                              self.astro.min,
                              self.astro.lat,
                              self.astro.lng,
                              self.astro.tz,
                              self.ephem);
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
    }*/

    func print() {
        do {
            /*
            let ta = theme_astral(self.astro.y,
                                  self.astro.m,
                                  self.astro.d,
                                  self.astro.hour,
                                  self.astro.min,
                                  self.astro.lat,
                                  self.astro.lng,
                                  self.astro.tz,
                                  self.ephem);
            let svg: String = String(cString: UnsafePointer<CChar>(ta.b_64))
            
            
            guard
                var documentsURL = (FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)).last,
                let convertedData = Data(base64Encoded: svg)
            else {
                //handle error when getting documents URL
                // TODO pdf d'erreur
                //let url = Bundle.main.url(forResource: "cfc", withExtension: "pdf")!
                //return url
                return
            }
            
            documentsURL.appendPathComponent("astrologie.svg")
            do {
                try convertedData.write(to: documentsURL)
            } catch {
                //handle write error here
                // TODO pdf d'erreur
            }
            
            let svg_file = documentsURL.absoluteString
            let svg_file2 = svg_file.replacingOccurrences(of: "file://", with: "")
            
            let base64StringPtr = create_png_from_file(svg_file2).b_64
            */
            let printInfo = UIPrintInfo(dictionary: nil)
            printInfo.outputType = UIPrintInfo.OutputType.general
            printInfo.jobName = "Theme astral"
            
            //let png: String = String(cString: UnsafePointer<CChar>(base64StringPtr!))
            
            let png = self.pngPath
            
            let createPdf = create_pdf_b64_from_png_b64(png)
            
            let base64String: String = String(cString: UnsafePointer<CChar>(createPdf.b_64))
            let base64StringRes: String = String(cString: UnsafePointer<CChar>(createPdf.err))
            
            let pdfFileData = Data(base64Encoded: base64String)
            
            let printController = UIPrintInteractionController.shared
            printController.printInfo = printInfo
            printController.printingItem = pdfFileData
            printController.present(animated: true, completionHandler: nil)
        } catch {
            // zip pas bon
        }
    }
    
    /*
    
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
    }*/
}
