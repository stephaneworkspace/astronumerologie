//
//  AstrologiePath.swift
//  astronumerologie
//
//  Created by Stéphane on 05.11.22.
//

import Foundation
import SwiftUI
import SweSvg

struct DrawCircle: Shape {
    var circles: [SweCore.AstroCircle]

    func path(in rect: CGRect) -> Path {
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
}

struct DrawLine: Shape {
    var lines: [SweCore.AstroLine]

    func path(in rect: CGRect) -> Path {
        var path = Path()
        for line in lines {
            path.move(to: CGPoint(x: line.lX1, y: line.lY1))
            path.addLine(to: CGPoint(x: line.lX2, y: line.lY2))
            path.closeSubpath()
        }
        return path
    }
}

struct DrawHouseLine: Shape {
    var lines: [SweCore.AstroHouseLine]

    func path(in rect: CGRect) -> Path {
        var path = Path()
        for line in lines {
            if !line.lXY3 {
                path.move(to: CGPoint(x: line.lX1, y: line.lY1))
                path.addLine(to: CGPoint(x: line.lX2, y: line.lY2))
                path.closeSubpath()
            }
        }
        return path
    }
}

struct DrawHouseTriangle: Shape {
    var lines: [SweCore.AstroHouseLine]

    func path(in rect: CGRect) -> Path {
        var path = Path()
        for line in lines {
            if line.lXY3 {
                path.move(to: CGPoint(x: line.lX3, y: line.lY3))
                path.addLine(to: CGPoint(x: line.lX1, y: line.lY1))
                path.addLine(to: CGPoint(x: line.lX2, y: line.lY2))
                path.addLine(to: CGPoint(x: line.lX3, y: line.lY3))
                path.closeSubpath()
            }
        }
        return path
    }
}

struct DrawBodieLine: Shape {
    var lines: [SweCore.AstroLine]
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        for line in lines {
            path.move(to: CGPoint(x: line.lX1, y: line.lY1))
            path.addLine(to: CGPoint(x: line.lX2, y: line.lY2))
            path.closeSubpath()
        }
        return path
    }
}

struct DrawAngleLine: Shape {
    var lines: [SweCore.AstroLine]
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        for line in lines {
            path.move(to: CGPoint(x: line.lX1, y: line.lY1))
            path.addLine(to: CGPoint(x: line.lX2, y: line.lY2))
            path.closeSubpath()
        }
        return path
    }
}
