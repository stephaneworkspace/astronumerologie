//
// Created by Stéphane on 10.09.22.
//

import Foundation

func reduction(iNumber: Int) -> [Int] {
    var aiRes = [Int]()
    var iTemp: Int = iNumber
    var bDone: Bool = false
    while !bDone {
        aiRes.append(iTemp)
        if String(iTemp).count == 1 {
            bDone = true
        }
        var iTemp2: Int = 0
        for i in 0...String(iTemp).count - 1 {
            let sTemp: String = String(iTemp)
            let index = sTemp.index(sTemp.startIndex, offsetBy: i)
            let cTemp: Character = sTemp[index]
            iTemp2 = iTemp2 + cTemp.wholeNumberValue! ?? 0
        }
        iTemp = iTemp2
    }
    return aiRes
}

func age(dBornDate: Date) -> Int {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "YYYY"
    let iYear = Int(dateFormatter.string(from: dBornDate)) ?? 1980
    dateFormatter.dateFormat = "MM"
    let iMonth = Int(dateFormatter.string(from: dBornDate)) ?? 1
    dateFormatter.dateFormat = "dd"
    let iDay = Int(dateFormatter.string(from: dBornDate)) ?? 1
    let dateFormater = DateFormatter()
    dateFormater.dateFormat = "MM/dd/yyyy"
    let sDate = String(iDay) + "." + String(iMonth) + "." + String(iYear)
    let birthdayDate = dateFormater.date(from: sDate)
    let now = Date()
    let calendar: NSCalendar! = NSCalendar(calendarIdentifier: .gregorian)
    let calcAge = calendar.components(.year, from: dBornDate, to: now, options: [])
    let age = calcAge.year!
    return age
}

func cheminDeVie(dBornDate: Date) -> String {
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
    var iTemp = iDay + iMonth + iYear
    let aiTempReduction = reduction(iNumber: iTemp)
    var sTemp: String = ""
    for ai in aiTempReduction {
        if sTemp == "" {
            sTemp = String(ai)
        } else {
            sTemp = sTemp + " / " + String(ai)
        }
    }
    return sTemp
}

func cheminDeVieInt(dBornDate: Date) -> Int {
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
    var iTemp = iDay + iMonth + iYear
    let aiTempReduction = reduction(iNumber: iTemp)
    return aiTempReduction.last! ?? 0
}

func jPlusMInt(dBornDate: Date) -> String {
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
    var iTemp = iDay + iMonth
    let aiTempReduction = reduction(iNumber: iTemp)
    var sTemp: String = ""
    for ai in aiTempReduction {
        if sTemp == "" {
            sTemp = String(ai)
        } else {
            sTemp = sTemp + " / " + String(ai)
        }
    }
    return sTemp
}

func jPlusAInt(dBornDate: Date) -> String {
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
    var iTemp = iDay + iYear
    let aiTempReduction = reduction(iNumber: iTemp)
    var sTemp: String = ""
    for ai in aiTempReduction {
        if sTemp == "" {
            sTemp = String(ai)
        } else {
            sTemp = sTemp + " / " + String(ai)
        }
    }
    return sTemp
}

func unPlusDeuxInt(dBornDate: Date) -> String {
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
    var iTemp = (iDay + iMonth) + (iDay + iYear)
    let aiTempReduction = reduction(iNumber: iTemp)
    var sTemp: String = ""
    for ai in aiTempReduction {
        if sTemp == "" {
            sTemp = String(ai)
        } else {
            sTemp = sTemp + " / " + String(ai)
        }
    }
    return sTemp
}

func mPlusAInt(dBornDate: Date) -> String {
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
    var iTemp = iMonth + iYear
    let aiTempReduction = reduction(iNumber: iTemp)
    var sTemp: String = ""
    for ai in aiTempReduction {
        if sTemp == "" {
            sTemp = String(ai)
        } else {
            sTemp = sTemp + " / " + String(ai)
        }
    }
    return sTemp
}

func cycleAdjacents(dBornDate: Date, eCycle: ECycle) -> String {
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
    var iTemp = 0;
    switch eCycle {
    case .Formatif:
        iTemp = iMonth
        break
    case .Productif:
        iTemp = iDay
        break
    case .Moisson:
        iTemp = iYear
        break
    }
    let aiTempReduction = reduction(iNumber: iTemp)
    var sTemp: String = ""
    for ai in aiTempReduction {
        if sTemp == "" {
            sTemp = String(ai)
        } else {
            sTemp = sTemp + " / " + String(ai)
        }
    }
    return sTemp
}
