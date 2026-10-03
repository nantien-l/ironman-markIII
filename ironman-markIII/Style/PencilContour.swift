import SwiftUI

/// Samples the actual component contour into short, pressure-like graphite marks.
/// Deterministic displacement stays below half a drawing unit, even when replayed.
struct PencilContour: Shape {
    let source: Path
    var seed: CGFloat = 0

    func path(in rect: CGRect) -> Path {
        let scaled = LocalArmorShape(path: source).path(in: rect)
        var result = Path()
        var cursor = CGPoint.zero
        var origin = CGPoint.zero
        var index = 0
        func mark(_ point: CGPoint, start: Bool = false) {
            let phase = CGFloat(index) * 2.399 + seed
            let point = CGPoint(x: point.x + sin(phase) * 0.20, y: point.y + cos(phase * 1.7) * 0.16)
            if start { result.move(to: point) } else { result.addLine(to: point) }
            index += 1
        }
        func line(_ end: CGPoint) {
            let start = cursor
            let count = max(1, Int(hypot(end.x - start.x, end.y - start.y) / 2))
            for i in 1...count {
                let t = CGFloat(i) / CGFloat(count)
                mark(CGPoint(x: start.x + (end.x - start.x) * t, y: start.y + (end.y - start.y) * t))
            }
            cursor = end
        }
        scaled.cgPath.applyWithBlock { element in
            let e = element.pointee
            switch e.type {
            case .moveToPoint:
                cursor = e.points[0]; origin = cursor; mark(cursor, start: true)
            case .addLineToPoint: line(e.points[0])
            case .addQuadCurveToPoint:
                let start = cursor, control = e.points[0], end = e.points[1]
                for i in 1...16 {
                    let t = CGFloat(i) / 16, u = 1 - t
                    mark(CGPoint(x: u*u*start.x + 2*u*t*control.x + t*t*end.x,
                                 y: u*u*start.y + 2*u*t*control.y + t*t*end.y))
                }
                cursor = end
            case .addCurveToPoint:
                let start = cursor, a = e.points[0], b = e.points[1], end = e.points[2]
                for i in 1...20 {
                    let t = CGFloat(i) / 20, u = 1 - t
                    mark(CGPoint(x: u*u*u*start.x + 3*u*u*t*a.x + 3*u*t*t*b.x + t*t*t*end.x,
                                 y: u*u*u*start.y + 3*u*u*t*a.y + 3*u*t*t*b.y + t*t*t*end.y))
                }
                cursor = end
            case .closeSubpath: line(origin); result.closeSubpath()
            @unknown default: break
            }
        }
        return result
    }
}

struct PencilHatching: Shape {
    func path(in rect: CGRect) -> Path {
        Path { p in
            for i in stride(from: -rect.height, through: rect.width + rect.height, by: 2.5) {
                p.move(to: CGPoint(x: i, y: rect.height))
                p.addLine(to: CGPoint(x: i + rect.height * 0.48, y: 0))
            }
        }
    }
}
