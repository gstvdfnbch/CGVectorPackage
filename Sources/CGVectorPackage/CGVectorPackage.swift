import SwiftUI

public extension CGVector {
    var magnitude: CGFloat {
        return sqrt(dx*dx + dy*dy)
    }
    
    // Normalize the vector conditionally
    func normalized(to maxLength: CGFloat) -> CGVector {
        let length = magnitude

        if length > maxLength {
            return CGVector(dx: dx / length * maxLength, dy: dy / length * maxLength)
        } else {
            return self
        }
    }
    
    // Add two vectors
    static func +(lhs: CGVector, rhs: CGVector) -> CGVector {
        return CGVector(dx: lhs.dx + rhs.dx, dy: lhs.dy + rhs.dy)
    }

    // Add point to the vector
    static func +(vector: CGVector, point: CGPoint) -> CGPoint {
        return CGPoint(x: point.x + vector.dx, y: point.y + vector.dy)
    }

    // Subtract two vectors
    static func -(lhs: CGVector, rhs: CGVector) -> CGVector {
        return CGVector(dx: lhs.dx - rhs.dx, dy: lhs.dy - rhs.dy)
    }

    // Subtract point from th vector
    static func -(vector: CGVector, point: CGPoint) -> CGPoint {
        return CGPoint(x: point.x - vector.dx, y: point.y - vector.dy)
    }

    // Rotate a vector like a clock hand
    func rotated(byDegrees degrees: CGFloat) -> CGVector {
        let radians = degrees * .pi / 180
        return rotated(byRadians: radians)
    }

    func rotated(byRadians radians: CGFloat) -> CGVector {
        let cosAngle = cos(radians)
        let sinAngle = sin(radians)
        
        var newDx = dx * cosAngle - dy * sinAngle
        var newDy = dx * sinAngle + dy * cosAngle
        
        // Set values smaller than 1e-5 to zero
        let epsilon: CGFloat = 1e-5
        if abs(newDx) < epsilon {
            newDx = 0
        }
        if abs(newDy) < epsilon {
            newDy = 0
        }

        return CGVector(dx: newDx, dy: newDy)
    }
    
    // Multiply a vector by a scalar
    static func *(vector: CGVector, scalar: CGFloat) -> CGVector {
        return CGVector(dx: vector.dx * scalar, dy: vector.dy * scalar)
    }
    
    // Dot product of two vectors
    static func dotProduct(_ lhs: CGVector, _ rhs: CGVector) -> CGFloat {
        return lhs.dx * rhs.dx + lhs.dy * rhs.dy
    }
    
    // Reflect Vector in choosed orientations.
    func reflected(against normal: CGVector) -> CGVector {
        let dotProduct = 2 * (self.dx * normal.dx + self.dy * normal.dy)
        return CGVector(dx: self.dx - dotProduct * normal.dx, dy: self.dy - dotProduct * normal.dy)
    }
    
    // Project vector 'a' onto vector 'b'
    // The order is important; it projects the first vector in the second.
    static func project(_ a: CGVector, onto b: CGVector) -> CGVector {
        let scale = dotProduct(a, b) / dotProduct(b, b)
        return b * scale
    }
    
    // Angle between two vectors
    static func angleBetween(_ lhs: CGVector, _ rhs: CGVector) -> CGFloat {
        return acos(dotProduct(lhs, rhs) / (lhs.magnitude * rhs.magnitude))
    }
}
