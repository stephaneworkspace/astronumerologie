//
// Created by Stéphane on 22.10.22.
//

import Foundation
import SwiftUI
import SweSvg
import SVGView

public class Swe {
    struct Circle {
        var center: Double
        var radius: Double
    }

    struct Line {
        var lX1: Double
        var lY1: Double
        var lX2: Double
        var lY2: Double
    }
    
    struct HouseLine {
        var lX1: Double
        var lY1: Double
        var lX2: Double
        var lY2: Double
        var lXY3: Bool
        var lX3: Double
        var lY3: Double
    }

    struct Offset {
        var offX: Double
        var offY: Double
    }
    
    struct SplitDeg {
        var print: String
        var deg: Int32
        var min: Int32
        var sec: Int32
        var cdegfr: Double
        var sign: Signs
        var result: Double
    }

    struct HouseResult {
        var cusps: [Double]
        var ascmc: [Double]
        var result: Int32
    }
    
    struct Object {
        var sign: Signs
        var oSx: Double
        var oSy: Double
        var oPx: Double
        var oPy: Double
    }

    struct ObjectHouse {
        var oSx: Double
        var oSy: Double
        var oPx: Double
        var oPy: Double
    }

    struct ObjectBodie {
        var swRetrograde: Bool
        var oSx: Double
        var oSy: Double
        var oPx: Double
        var oPy: Double
    }
    
    struct ObjectAngle {
        var oSx: Double
        var oSy: Double
        var oPx: Double
        var oPy: Double
    }

    public var size: Int // TODO sizeChart: (screenSize.width == 744 && screenSize.height == 1133) ? 630.0 : 390.0)
    public var colorMode: SweSvg.ColorMode
    public var bodies: [Bodies]
    public var swec: SweSvg

    public init(pathEphe: String) {
        size = 400
        colorMode = .Light
        bodies = []
        bodies.append(Bodies.Soleil)
        bodies.append(Bodies.Lune)
        bodies.append(Bodies.Mercure)
        bodies.append(Bodies.Venus)
        bodies.append(Bodies.Mars)
        bodies.append(Bodies.Jupiter)
        bodies.append(Bodies.Saturn)
        bodies.append(Bodies.Uranus)
        bodies.append(Bodies.Neptune)
        bodies.append(Bodies.Pluto)
        bodies.append(Bodies.NoeudLunaire)
        //bodies.append(Bodies.Chiron)
        //bodies.append(Bodies.Ceres)
        //bodies.append(Bodies.NoeudLunaireSud)
        self.swec = SweSvg(ephemPath: pathEphe)
    }
    
    public func set(natal: Date, transit: Date, lat: Double, lng: Double, tz: Int32, colorScheme: ColorScheme) {
        colorMode = colorScheme == .light ? .Light : .Dark
        self.swec.set(natal: natal, transit: transit, lat: lat, lng: lng, tz: tz, colorMode: colorMode)
    }

    func drawCircle(circles: [Circle]) -> Path {
        var path = Path()
        for circle in circles.reversed() {
            path.move(to: CGPoint(x: circle.center + circle.radius, y: circle.center))
            path.addArc(
                    center: CGPoint(
                            x: circle.center,
                            y: circle.center),
                    radius: circle.radius,
                    startAngle: .zero,
                    endAngle: .degrees(360.0),
                    clockwise: false)
            path.closeSubpath()
        }
        return path
    }

    func drawLine(lines: [Line]) -> Path {
        var path = Path()
        for line in lines {
            path.move(to: CGPoint(x: line.lX1, y: line.lY1))
            path.addLine(to: CGPoint(x: line.lX2, y: line.lY2))
            path.closeSubpath()
        }
        return path
    }
    

    func circles() -> [Circle] {
        var res: [Circle] = []
        let center = getRadiusTotal()
        for (idx, circleSize) in CIRCLE_SIZE_TRANSIT.enumerated() {
            if circleSize.1 {
                let radius = getRadiusCircle(occurs: idx).0
                res.append(Circle(center: center, radius: radius))
            }
        }
        return res
    }

    func zodiac_lines() -> [Line] {
        var res: [Line] = []
        for iIdx in 1...12 {
            // 0°
            let offPosAsc = 360.0 - swec.houses[0].longitude
            var pos = Double(iIdx) * 30.0 + offPosAsc
            pos = getFixedPos(pos_value: pos)
            let axy: [Offset] = getLineTrigo(
                    angular: pos,
                    radiusCircleBegin: getRadiusCircle(occurs: 2).0,
                    radiusCircleEnd: getRadiusCircle(occurs: 1).0)
            res.append(Line(
                    lX1: axy[0].offX,
                    lY1: axy[0].offY,
                    lX2: axy[1].offX,
                    lY2: axy[1].offY)
            )
            // 1° to 29°
            var largerDrawLine: LargerDrawLine = .large
            for jIdx in 1...15 {
                if jIdx == 5 || jIdx == 10 || jIdx == 15 {
                    largerDrawLine = .large
                } else {
                    largerDrawLine = .small
                }
                pos = (Double(iIdx) * 30.0) + Double(jIdx) * 2.0 + offPosAsc
                pos = getFixedPos(pos_value: pos)
                let axy: [Offset] = getLineTrigo(
                        angular: pos,
                        radiusCircleBegin: getRadiusCircle(occurs: 2).0,
                        radiusCircleEnd: getRadiusRulesInsideCircle(largerDrawLine: largerDrawLine))
                res.append(Line(
                        lX1: axy[0].offX,
                        lY1: axy[0].offY,
                        lX2: axy[1].offX,
                        lY2: axy[1].offY)
                )
            }
        }
        return res
    }

    func zodiac_sign(sign: Int) -> Object {
        let zodiacSize = (((ZODIAC_SIZE * ZODIAC_RATIO) / 100.0) * Double(size)) / 100.0;
        let offPosAsc = CIRCLE - swec.houses[0].longitude
        let signEnum: Signs = Signs.init(rawValue: sign) ?? Signs.aries
        let pos = (Double(signEnum.rawValue - 1) * 30.0) + 15.0 + offPosAsc
        let offset = getCenterItem(
                size: zodiacSize,
                offset: getPosTrigo(
                        angular: pos,
                        radiusCircle: getRadiusCircleZodiac()))
        let res = Object(
                sign: signEnum,
                oSx: zodiacSize,
                oSy: zodiacSize,
                oPx: offset.offX,
                oPy: offset.offY)
        return res
    }
    
    func house(number: Int) -> ObjectHouse {
        var houseSize = (((HOUSE_SIZE * HOUSE_RATIO) / 100.0) * Double(size)) / 100.0
        let offPosAsc = CIRCLE - swec.houses[0].longitude
        var posNext: Double
        if number > 11 {
            posNext = swec.houses[0].longitude + offPosAsc
        } else {
            posNext = swec.houses[Int(number)].longitude + offPosAsc
        }
        let posNow = swec.houses[Int(number - 1)].longitude + offPosAsc
        var pos: Double
        if posNow > posNext {
            pos = posNow + ((posNext - posNow - CIRCLE) / 2.0)
        } else {
            pos = posNow + ((posNext - posNow) / 2.0)
        }
        pos = getFixedPos(pos_value: pos)
        let offset = getCenterItem(
                size: houseSize,
                offset: getPosTrigo(
                        angular: pos,
                        radiusCircle: getRadiusCircleHouse()))
        if number > 9 {
            return ObjectHouse(
                    oSx: houseSize,
                    oSy: houseSize,
                    oPx: offset.offX,
                    oPy: offset.offY)
        } else {
            return ObjectHouse(
                    oSx: houseSize / 1.5,
                    oSy: houseSize,
                    oPx: offset.offX,
                    oPy: offset.offY)

        }
    }
    
    func bodie(bodie: Bodies, swTransit: Bool) -> ObjectBodie {
        var planetRatio: Double
        if swTransit {
            planetRatio = 6.0 // TODO const
        } else {
            planetRatio = 12.0 // TODO const
        }
        let planetSize = (((BODIE_SIZE * ZODIAC_RATIO) / 100.0) * Double(size)) / 100.0;
        let degRatio = 6.0 // TODO const
        let degSize = (((DEG_SIZE * degRatio) / 100.0) * Double(size))
        let minRatio = 6.0 // TODO const
        let minSize = (((MIN_SIZE * degRatio) / 100.0) * Double(size))
        var swRetrograde = false
        if (!swTransit) {
            // natal
            for b in swec.bodiesNatal {
                if b.bodie == bodie.rawValue {
                    if abs(b.calc_ut.speed_longitude) < 0.0003 {
                        // Stationary
                    } else if b.calc_ut.speed_longitude > 0.0 {
                        // Direct
                    } else {
                        swRetrograde = true
                    }
                }
            }
        } else {
            // transit
            for b in swec.bodiesTransit {
                if b.bodie == bodie.rawValue {
                    if abs(b.calc_ut.speed_longitude) < 0.0003 {
                        // Stationary
                    } else if b.calc_ut.speed_longitude > 0.0 {
                        // Direct
                    } else {
                        swRetrograde = true
                    }
                }
            }
        }

        var pos = 0.0
        if (!swTransit) {
            // natal
            for b in swec.bodiesNatal {
                if b.bodie == bodie.rawValue {
                    pos = getBodieLongitude(bodie_longitude: b.calc_ut.longitude, swTransit: swTransit)
                }
            }
        } else {
            // transit
            for b in swec.bodiesTransit {
                if b.bodie == bodie.rawValue {
                    pos = getBodieLongitude(bodie_longitude: b.calc_ut.longitude, swTransit: swTransit)
                }
            }
        }
        let offset: Offset
        if swTransit {
            offset = getCenterItem(
                    size: planetSize,
                    offset: getPosTrigo(
                            angular: pos,
                            radiusCircle: getRadiusCircle(occurs: 9).0))
        } else {
            offset = getCenterItem(
                    size: planetSize,
                    offset: getPosTrigo(
                            angular: pos,
                            radiusCircle: getRadiusCircle(occurs: 5).0))
        }
        // TODO deg min line 1336 sw_draw.rs
        let res = ObjectBodie(
                swRetrograde: swRetrograde,
                oSx: planetSize,
                oSy: planetSize,
                oPx: offset.offX,
                oPy: offset.offY)
        return res
    }
    
    func bodie_lines(bodie: Bodies, swTransit: Bool) -> [Line] {
        var res: [Line] = []
        var pos = 0.0
        if (!swTransit) {
            // natal
            for b in swec.bodiesNatal {
                if (b.bodie == bodie.rawValue) {
                    var axy: [Offset]
                    pos = getBodieLongitude(bodie_longitude: b.calc_ut.longitude, swTransit: swTransit)
                    axy =
                            getLineTrigo(
                                    angular: pos,
                                    radiusCircleBegin: getRadiusCircle(occurs: 3).0,
                                    radiusCircleEnd: getRadiusCircle(occurs: 7).0)
                    res.append(Line(
                            lX1: axy[0].offX,
                            lY1: axy[0].offY,
                            lX2: axy[1].offX,
                            lY2: axy[1].offY)
                    )
                    axy = getLineTrigo(
                            angular: pos,
                            radiusCircleBegin: getRadiusCircle(occurs: 7).0,
                            radiusCircleEnd: getRadiusCircle(occurs: 8).0)
                    res.append(Line(
                            lX1: axy[0].offX,
                            lY1: axy[0].offY,
                            lX2: axy[1].offX,
                            lY2: axy[1].offY)
                    )
                }
            }
        } else {
            // transit
            for b in swec.bodiesTransit {
                if (b.bodie == bodie.rawValue) {
                    var axy: [Offset]
                    pos = getBodieLongitude(bodie_longitude: b.calc_ut.longitude, swTransit: swTransit)
                    axy =
                            getLineTrigo(
                                    angular: pos,
                                    radiusCircleBegin: getRadiusCircle(occurs: 1).0,
                                    radiusCircleEnd: getRadiusCircle(occurs: 10).0)
                    res.append(Line(
                            lX1: axy[0].offX,
                            lY1: axy[0].offY,
                            lX2: axy[1].offX,
                            lY2: axy[1].offY)
                    )
                    axy = getLineTrigo(
                            angular: pos,
                            radiusCircleBegin: getRadiusCircle(occurs: 10).0,
                            radiusCircleEnd: getRadiusCircle(occurs: 11).0)
                    res.append(Line(
                            lX1: axy[0].offX,
                            lY1: axy[0].offY,
                            lX2: axy[1].offX,
                            lY2: axy[1].offY)
                    )
                }
            }
        }
        return res
    }
    
    func angle(a: Angles) -> ObjectAngle {
        let angleRatio = 12.0 // TODO const
        var angleSize = (((ANGLE_SIZE * angleRatio) / 100.0) * Double(size)) / 100.0
        let pos = getAngleLongitude(angle: a)
        let offAngle = getCenterItem(
                size: angleSize,
                offset: getPosTrigo(
                        angular: pos,
                        radiusCircle: getRadiusCircle(occurs: 5).0))
        let res = ObjectAngle(
                oSx: angleSize,
                oSy: angleSize,
                oPx: offAngle.offX,
                oPy: offAngle.offY)
        return res
    }

    private func getRadiusTotal() -> Double {
        Double(size) / 2.0
    }

    private func getRadiusCircle(occurs: Int) -> (Double, Bool) {
        let res = getRadiusTotal() * CIRCLE_SIZE_TRANSIT[occurs].0 / 100
        return (res, CIRCLE_SIZE_TRANSIT[occurs].1)
    }

    private func getFixedPos(pos_value: Double) -> Double {
        var pos = pos_value
        var done = false
        while !done {
            if pos >= 360.0 {
                pos = pos - 360.0
            }
            if pos >= 360 {

            } else {
                done = true
            }
        }
        return pos
    }

    private func getLineTrigo(angular: Double, radiusCircleBegin: Double, radiusCircleEnd: Double) -> [Offset] {
        var res: [Offset] = []
        let dx1: Double = getCenter().offX
                + cos(angular / CIRCLE * 2.0 * Double.pi)
                * -1.0
                * radiusCircleBegin
        let dx2: Double = getCenter().offY
                + sin(angular / CIRCLE * 2.0 * Double.pi)
                * radiusCircleBegin
        let dy1: Double = getCenter().offX
                + cos(angular / CIRCLE * 2.0 * Double.pi)
                * -1.0
                * radiusCircleEnd
        let dy2: Double = getCenter().offY
                + sin(angular / CIRCLE * 2.0 * Double.pi)
                * radiusCircleEnd
        res.append(Offset(offX: dx1, offY: dx2))
        res.append(Offset(offX: dy1, offY: dy2))
        return res
    }

    func getRadiusRulesInsideCircle(largerDrawLine: LargerDrawLine) -> Double {
        var size = 0.0
        switch largerDrawLine {
        case .small:
            size = 1.0 + LARGER_DRAW_LINE_RULES_SMALL
        case .large:
            size = 1.0 + LARGER_DRAW_LINE_RULES_LARGE
        }
        return getRadiusTotal() * (((CIRCLE_SIZE_TRANSIT[2].0 - CIRCLE_SIZE_TRANSIT[1].0) / size)
                + CIRCLE_SIZE_TRANSIT[1].0) / 100.0
    }
    
    func house_lines() -> [HouseLine] {
        var res: [HouseLine] = []
        for iIdx in 0...11 {
            let offHouse = 360.0 - swec.houses[0].longitude
            let pos = getFixedPos(pos_value: offHouse + swec.houses[iIdx].longitude)
            var axyTriangle: [Offset] = []
            let angularPointer = -1.0 // TODO CONST
            if swec.houses[iIdx].angle == Angles.nothing.rawValue {
                axyTriangle = getTriangleTrigo(
                        angular: pos,
                        angularPointer: angularPointer,
                        radiusCircleBegin: getRadiusInsideCircleHouseForPointerBottom(),
                        radiusCircleEnd: getRadiusInsideCircleHouseForPointerTop())
                let axyLine: [Offset] = getLineTrigo(
                        angular: pos,
                        radiusCircleBegin: getRadiusCircle(occurs: 3).0,
                        radiusCircleEnd: getRadiusCircle(occurs: 2).0)
                res.append(HouseLine(
                        lX1: axyLine[0].offX,
                        lY1: axyLine[0].offY,
                        lX2: axyLine[1].offX,
                        lY2: axyLine[1].offY,
                        lXY3: false,
                        lX3: 0.0,
                        lY3: 0.0)
                )
            } else {
                axyTriangle = getTriangleTrigo(
                        angular: pos,
                        angularPointer: angularPointer,
                        radiusCircleBegin: getRadiusCircle(occurs: 3).0,
                        radiusCircleEnd: getRadiusCircle(occurs: 2).0)
            }
            res.append(HouseLine(
                    lX1: axyTriangle[0].offX,
                    lY1: axyTriangle[0].offY,
                    lX2: axyTriangle[1].offX,
                    lY2: axyTriangle[1].offY,
                    lXY3: true,
                    lX3: axyTriangle[2].offX,
                    lY3: axyTriangle[2].offY)
            )
        }
        return res
    }

    private func getCenter() -> Offset {
        Offset(offX: getRadiusTotal(), offY: getRadiusTotal())
    }

    private func getCenterItem(size: Double, offset: Offset) -> Offset {
        Offset(
                offX: offset.offX - (size / 2.0),
                offY: offset.offY - (size / 2.0))
    }

    private func getPosTrigo(angular: Double, radiusCircle: Double) -> Offset {
        let getCenter = getRadiusTotal()
        return Offset(
                offX: getCenter + cos(angular / CIRCLE * 2.0 * Double.pi) * -1.0 * radiusCircle,
                offY: getCenter + sin(angular / CIRCLE * 2.0 * Double.pi) * radiusCircle)
    }

    private func getRadiusCircleZodiac() -> Double {
        let divTraitBig = 0.2
        return (getRadiusTotal() * (
                (
                        (CIRCLE_SIZE_TRANSIT[2].0 - CIRCLE_SIZE_TRANSIT[1].0) / (2.0 + divTraitBig)
                ) + CIRCLE_SIZE_TRANSIT[1].0))
                / 100.0
    }
    
    private func getRadiusInsideCircleHouseForPointerBottom() -> Double {
        let divTraitPointer = 1.5 // TODO CONST
        return (getRadiusTotal() * (((CIRCLE_SIZE_TRANSIT[3].0 - CIRCLE_SIZE_TRANSIT[2].0)
                / divTraitPointer)
                - CIRCLE_SIZE_TRANSIT[3].0)) / 100.0
    }

    private func getRadiusInsideCircleHouseForPointerTop() -> Double {
        (getRadiusTotal() * ((CIRCLE_SIZE_TRANSIT[3].0 - CIRCLE_SIZE_TRANSIT[2].0)
                - CIRCLE_SIZE_TRANSIT[3].0)) / 100.0
    }

    private func getTriangleTrigo(angular: Double, angularPointer: Double, radiusCircleBegin: Double, radiusCircleEnd: Double) -> [Offset] {
        var res: [Offset] = []
        let angular1 = getFixedPos(pos_value: angular - angularPointer)
        let angular2 = getFixedPos(pos_value: angular + angularPointer)
        let dx1: Double = getCenter().offX
                + cos(angular1 / CIRCLE * 2.0 * Double.pi)
                * -1.0
                * radiusCircleBegin
        let dy1: Double = getCenter().offY
                + sin(angular1 / CIRCLE * 2.0 * Double.pi)
                * radiusCircleBegin
        let dx2: Double = getCenter().offX
                + cos(angular2 / CIRCLE * 2.0 * Double.pi)
                * -1.0
                * radiusCircleBegin
        let dy2: Double = getCenter().offY
                + sin(angular2 / CIRCLE * 2.0 * Double.pi)
                * radiusCircleBegin
        let dx3: Double = getCenter().offX
                + cos(angular / CIRCLE * 2.0 * Double.pi)
                * -1.0
                * radiusCircleEnd
        let dy3: Double = getCenter().offY
                + sin(angular / CIRCLE * 2.0 * Double.pi)
                * radiusCircleEnd
        res.append(Offset(offX: dx1, offY: dy1))
        res.append(Offset(offX: dx2, offY: dy2))
        res.append(Offset(offX: dx3, offY: dy3))
        return res
    }

    private func getRadiusCircleHouse() -> Double {
        (getRadiusTotal() * (((
                (CIRCLE_SIZE_TRANSIT[3].0 - CIRCLE_SIZE_TRANSIT[2].0) / 2.0))
                + CIRCLE_SIZE_TRANSIT[2].0))
                / 100.0
    }
    
    private func getBodieLongitude(bodie_longitude: Double, swTransit: Bool) -> Double {
        var pos = 0.0
        if swTransit {
            pos = CIRCLE - swec.houses[0].longitude + bodie_longitude
        } else {
            pos = CIRCLE - swec.houses[0].longitude + bodie_longitude
        }
        pos = getFixedPos(pos_value: pos)
        return pos
    }
    
    private func getAngleLongitude(angle: Angles) -> Double {
        var pos = 0.0
        for house in swec.houses {
            if house.angle == angle.rawValue {
                pos = CIRCLE - swec.houses[0].longitude + house.longitude
                break
            }
        }
        pos = getFixedPos(pos_value: pos)
        return pos
    }
}



