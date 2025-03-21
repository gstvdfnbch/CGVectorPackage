# CGVector Extension

A Swift package that provides extended functionality for `CGVector` to support various mathematical and geometric operations, such as vector normalization, rotation, addition, subtraction, dot product, reflection, and more.

## Installation

To use the `CGVector` extension package, add it to your project by following these steps:

### Using Swift Package Manager (SPM)

1. Open your project in Xcode.
2. In the top menu, select **File > Swift Packages > Add Package Dependency**.
3. Enter the URL of the repository containing the `CGVector` extension package (e.g., `https://github.com/gstvdfnbch/CGVectorPackage`).
4. Choose the appropriate version and click **Add Package**.

## Import the Package

Once the package is added, import it into the Swift file where you want to use the extensions:

```swift
import CGVectorPackage
```

## Available Functions

### 1. Magnitude

The `magnitude` property calculates the length of a vector from its `dx` and `dy` components.

**Usage Example:**

```swift
let vector = CGVector(dx: 3, dy: 4)
let magnitude = vector.magnitude
print(magnitude)  // Output: 5.0
```

### 2. Normalize to Maximum Length

The `normalized(to:)` method scales the vector so that its length does not exceed a given maximum value.

**Usage Example:**

```swift
let vector = CGVector(dx: 6, dy: 8)
let normalizedVector = vector.normalized(to: 5)
print(normalizedVector)  // Output: CGVector(dx: 3.0, dy: 4.0)
```

### 3. Addition of Two Vectors

You can add two `CGVector` instances using the `+` operator.

**Usage Example:**

```swift
let vector1 = CGVector(dx: 1, dy: 2)
let vector2 = CGVector(dx: 3, dy: 4)
let result = vector1 + vector2
print(result)  // Output: CGVector(dx: 4.0, dy: 6.0)
```

### 4. Adding a Vector to a Point

You can add a `CGVector` to a `CGPoint` to get the new position.

**Usage Example:**

```swift
let vector = CGVector(dx: 2, dy: 3)
let point = CGPoint(x: 1, y: 1)
let newPoint = vector + point
print(newPoint)  // Output: CGPoint(x: 3.0, y: 4.0)
```

### 5. Subtraction of Two Vectors

You can subtract one `CGVector` from another using the `-` operator.

**Usage Example:**

```swift
let vector1 = CGVector(dx: 3, dy: 4)
let vector2 = CGVector(dx: 1, dy: 2)
let result = vector1 - vector2
print(result)  // Output: CGVector(dx: 2.0, dy: 2.0)
```

### 6. Subtracting a Vector from a Point

You can subtract a `CGVector` from a `CGPoint`.

**Usage Example:**

```swift
let vector = CGVector(dx: 1, dy: 2)
let point = CGPoint(x: 3, y: 4)
let result = vector - point
print(result)  // Output: CGPoint(x: 2.0, y: 2.0)
```

### 7. Rotating a Vector by Degrees

You can rotate a vector by a certain number of degrees using the `rotated(byDegrees:)` method.

**Usage Example:**

```swift
let vector = CGVector(dx: 1, dy: 0)
let rotatedVector = vector.rotated(byDegrees: 90)
print(rotatedVector)  // Output: CGVector(dx: 0.0, dy: 1.0)
```

### 8. Multiplying a Vector by a Scalar

You can multiply a vector by a scalar using the `*` operator.

**Usage Example:**

```swift
let vector = CGVector(dx: 2, dy: 3)
let scaledVector = vector * 2
print(scaledVector)  // Output: CGVector(dx: 4.0, dy: 6.0)
```

### 9. Dot Product of Two Vectors

You can calculate the dot product of two `CGVector` instances using the `dotProduct` function.

**Usage Example:**

```swift
let vector1 = CGVector(dx: 1, dy: 2)
let vector2 = CGVector(dx: 3, dy: 4)
let result = CGVector.dotProduct(vector1, vector2)
print(result)  // Output: 11.0
```

### 10. Reflecting a Vector

You can reflect a vector against a given normal vector.

**Usage Example:**

```swift
let vector = CGVector(dx: 1, dy: 1)
let normal = CGVector(dx: 0, dy: 1)
let reflectedVector = vector.reflected(against: normal)
print(reflectedVector)  // Output: CGVector(dx: 1.0, dy: -1.0)
```

### 11. Projecting a Vector onto Another

You can project one vector onto another using the `project(_:onto:)` function.

**Usage Example:**

```swift
let vectorA = CGVector(dx: 1, dy: 1)
let vectorB = CGVector(dx: 2, dy: 2)
let projectedVector = CGVector.project(vectorA, onto: vectorB)
print(projectedVector)  // Output: CGVector(dx: 1.0, dy: 1.0)
```

### 12. Angle Between Two Vectors

You can calculate the angle between two vectors using the `angleBetween` function.

**Usage Example:**

```swift
let vector1 = CGVector(dx: 1, dy: 0)
let vector2 = CGVector(dx: 0, dy: 1)
let angle = CGVector.angleBetween(vector1, vector2)
print(angle)  // Output: 1.5707963 (or pi/2 radians)
```

## License

This package is licensed under the MIT License. 
