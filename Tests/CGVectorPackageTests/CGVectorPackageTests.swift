import XCTest
@testable import CGVectorLibrary

final class CGVectorLibraryTests: XCTestCase {
    // Test magnitude of the vector
       func testMagnitude() {
           let vector = CGVector(dx: 3, dy: 4)
           XCTAssertEqual(vector.magnitude, 5, "Magnitude should be 5")
       }
       
       // Test normalize the vector
       func testNormalize() {
           let vector = CGVector(dx: 6, dy: 8)
           let normalizedVector = vector.normalized(to: 5)
           XCTAssertEqual(normalizedVector.magnitude, 5, "Normalized vector should have magnitude 5")
       }
       
       // Test adding two vectors
       func testAddVectors() {
           let vector1 = CGVector(dx: 1, dy: 2)
           let vector2 = CGVector(dx: 3, dy: 4)
           let result = vector1 + vector2
           XCTAssertEqual(result, CGVector(dx: 4, dy: 6), "Vectors should add up correctly")
       }

       // Test adding vector to point
       func testAddVectorToPoint() {
           let vector = CGVector(dx: 1, dy: 2)
           let point = CGPoint(x: 3, y: 4)
           let result = vector + point
           XCTAssertEqual(result, CGPoint(x: 4, y: 6), "Point should be moved correctly by the vector")
       }
       
       // Test subtracting two vectors
       func testSubtractVectors() {
           let vector1 = CGVector(dx: 3, dy: 4)
           let vector2 = CGVector(dx: 1, dy: 2)
           let result = vector1 - vector2
           XCTAssertEqual(result, CGVector(dx: 2, dy: 2), "Vectors should subtract correctly")
       }
       
       // Test subtracting vector from point
       func testSubtractVectorFromPoint() {
           let vector = CGVector(dx: 1, dy: 2)
           let point = CGPoint(x: 3, y: 4)
           let result = vector - point
           XCTAssertEqual(result, CGPoint(x: 2, y: 2), "Point should be correctly subtracted by the vector")
       }
       
       // Test rotating a vector by degrees
       func testRotateByDegrees() {
           let vector = CGVector(dx: 1, dy: 0)
           let rotatedVector = vector.rotated(byDegrees: 90)
           XCTAssertEqual(rotatedVector, CGVector(dx: 0, dy: 1), "Vector should be correctly rotated")
       }
       
       // Test multiplying a vector by a scalar
       func testMultiplyByScalar() {
           let vector = CGVector(dx: 2, dy: 3)
           let result = vector * 2
           XCTAssertEqual(result, CGVector(dx: 4, dy: 6), "Vector should be correctly scaled by scalar")
       }
       
       // Test dot product of two vectors
       func testDotProduct() {
           let vector1 = CGVector(dx: 1, dy: 2)
           let vector2 = CGVector(dx: 3, dy: 4)
           let result = CGVector.dotProduct(vector1, vector2)
           XCTAssertEqual(result, 11, "Dot product should be correctly calculated")
       }
       
       // Test reflecting a vector against a normal
       func testReflection() {
           let vector = CGVector(dx: 1, dy: 1)
           let normal = CGVector(dx: 0, dy: 1)
           let reflectedVector = vector.reflected(against: normal)
           XCTAssertEqual(reflectedVector, CGVector(dx: 1, dy: -1), "Reflection should work correctly")
       }
       
       // Test projection of a vector onto another
       func testProjection() {
           let vectorA = CGVector(dx: 1, dy: 1)
           let vectorB = CGVector(dx: 2, dy: 2)
           let projectedVector = CGVector.project(vectorA, onto: vectorB)
           XCTAssertEqual(projectedVector, CGVector(dx: 1, dy: 1), "Projection should work correctly")
       }
       
       // Test angle between two vectors
       func testAngleBetween() {
           let vector1 = CGVector(dx: 1, dy: 0)
           let vector2 = CGVector(dx: 0, dy: 1)
           let angle = CGVector.angleBetween(vector1, vector2)
           XCTAssertEqual(angle, .pi / 2, "Angle between vectors should be 90 degrees or pi/2 radians")
       }
}
