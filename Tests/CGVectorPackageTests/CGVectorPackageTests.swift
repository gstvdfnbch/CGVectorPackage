import XCTest
@testable import CGVectorPackage

final class CGVectorLibraryTests: XCTestCase {
    
    // MARK: - Magnitude
    func testMagnitude() {
        let vector = CGVector(dx: 3, dy: 4)
        XCTAssertEqual(vector.magnitude, 5)
    }
    
    // MARK: - Normalize
    func testNormalize() {
        let vector = CGVector(dx: 6, dy: 8)
        let normalizedVector = vector.normalized(to: 5)
        XCTAssertEqual(normalizedVector.magnitude, 5, accuracy: 0.0001)
    }
    
    func testNormalizeExactLength() {
        let vector = CGVector(dx: 3, dy: 4) // magnitude = 5
        let normalized = vector.normalized(to: 5)
        XCTAssertEqual(normalized, vector)
    }
    
    // MARK: - Add Vectors
    func testAddVectors() {
        let vector1 = CGVector(dx: 1, dy: 2)
        let vector2 = CGVector(dx: 3, dy: 4)
        let result = vector1 + vector2
        XCTAssertEqual(result, CGVector(dx: 4, dy: 6))
    }
    
    func testAddVectorToPoint() {
        let vector = CGVector(dx: 1, dy: 2)
        let point = CGPoint(x: 3, y: 4)
        let result = vector + point
        XCTAssertEqual(result, CGPoint(x: 4, y: 6))
    }
    
    // MARK: - Subtract Vectors
    func testSubtractVectors() {
        let vector1 = CGVector(dx: 3, dy: 4)
        let vector2 = CGVector(dx: 1, dy: 2)
        let result = vector1 - vector2
        XCTAssertEqual(result, CGVector(dx: 2, dy: 2))
    }
    
    func testSubtractVectorFromPoint() {
        let vector = CGVector(dx: 1, dy: 2)
        let point = CGPoint(x: 3, y: 4)
        let result = vector - point
        XCTAssertEqual(result, CGPoint(x: 2, y: 2))
    }
    
    // MARK: - Rotate
    func testRotateByDegrees() {
        let vector = CGVector(dx: 1, dy: 0)
        let rotatedVector = vector.rotated(byDegrees: 90)
        XCTAssertEqual(rotatedVector.dx, 0, accuracy: 0.0001)
        XCTAssertEqual(rotatedVector.dy, 1, accuracy: 0.0001)
    }
    
    func testRotateByRadians() {
        let vector = CGVector(dx: 0, dy: 1)
        let rotated = vector.rotated(byRadians: .pi / 2)
        XCTAssertEqual(rotated.dx, -1, accuracy: 1e-6)
        XCTAssertEqual(rotated.dy, 0, accuracy: 1e-6)
    }
    
    func testRotationNearZero() {
        let vector = CGVector(dx: 1, dy: 0)
        let rotated = vector.rotated(byDegrees: 0.00001)
        XCTAssertEqual(rotated.dx, 1, accuracy: 1e-6)
        XCTAssertEqual(rotated.dy, 0, accuracy: 1e-6)
    }
    
    // MARK: - Scalar Multiplication
    func testMultiplyByScalar() {
        let vector = CGVector(dx: 2, dy: 3)
        let result = vector * 2
        XCTAssertEqual(result, CGVector(dx: 4, dy: 6))
    }
    
    // MARK: - Dot Product
    func testDotProduct() {
        let vector1 = CGVector(dx: 1, dy: 2)
        let vector2 = CGVector(dx: 3, dy: 4)
        let result = CGVector.dotProduct(vector1, vector2)
        XCTAssertEqual(result, 11)
    }
    
    // MARK: - Reflection
    func testReflection() {
        let vector = CGVector(dx: 1, dy: 1)
        let normal = CGVector(dx: 0, dy: 1)
        let reflectedVector = vector.reflected(against: normal)
        XCTAssertEqual(reflectedVector, CGVector(dx: 1, dy: -1))
    }
    
    func testReflectionDiagonalNormal() {
        let vector = CGVector(dx: 1, dy: 0)
        let normal = CGVector(dx: 1, dy: 1).normalized(to: 1)
        let reflected = vector.reflected(against: normal)
        XCTAssertEqual(reflected.dx, 0, accuracy: 1e-4)
        XCTAssertEqual(reflected.dy, -1, accuracy: 1e-4)
    }
    
    // MARK: - Projection
    func testProjection() {
        let vectorA = CGVector(dx: 1, dy: 1)
        let vectorB = CGVector(dx: 2, dy: 2)
        let projectedVector = CGVector.project(vectorA, onto: vectorB)
        XCTAssertEqual(projectedVector.dx, 1, accuracy: 1e-5)
        XCTAssertEqual(projectedVector.dy, 1, accuracy: 1e-5)
    }
    
    func testProjectionOntoZeroVector() {
        let a = CGVector(dx: 1, dy: 1)
        let b = CGVector(dx: 0, dy: 0)
        let result = CGVector.project(a, onto: b)
        XCTAssert(result.dx.isNaN)
    }
        
    // MARK: - Angle
    func testAngleBetween() {
        let vector1 = CGVector(dx: 1, dy: 0)
        let vector2 = CGVector(dx: 0, dy: 1)
        let angle = CGVector.angleBetween(vector1, vector2)
        XCTAssertEqual(angle, .pi / 2, accuracy: 1e-5)
    }
    
    func testAngleBetweenWithZeroVector() {
        let zero = CGVector(dx: 0, dy: 0)
        let vector = CGVector(dx: 1, dy: 0)
        let angle = CGVector.angleBetween(zero, vector)
        XCTAssert(angle.isNaN)
    }
    
}
