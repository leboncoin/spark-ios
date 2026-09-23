//
//  CGFloat+AngleExtension.swift
//  SparkCommon
//
//  Created by robin.lemaire on 25/11/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkCommon

class CGFloatAngleExtensionTests: XCTestCase {

    func testDegreesToRadiansPositiveAngle() {
        let angle: CGFloat = 45.0
        let expectedRadians: CGFloat = angle * .pi / 180

        let radians = angle.degreesToRadians

        XCTAssertEqual(radians, expectedRadians, accuracy: 0.000001)
    }

    func testDegreesToRadiansNegativeAngle() {
        let angle: CGFloat = -120.0
        let expectedRadians: CGFloat = angle * .pi / 180

        let radians = angle.degreesToRadians

        XCTAssertEqual(radians, expectedRadians, accuracy: 0.000001)
    }

    func testDegreesToRadiansZeroAngle() {
        let angle: CGFloat = 0.0

        let radians = angle.degreesToRadians

        XCTAssertEqual(radians, 0.0, accuracy: 0.000001)
    }

    func testDegreesToRadiansExtremeBoundaries() {
        let maxDegrees: CGFloat = 180.0
        let minDegrees: CGFloat = -180.0

        let maxRadians = maxDegrees.degreesToRadians
        let minRadians = minDegrees.degreesToRadians

        XCTAssertEqual(maxRadians, .pi, accuracy: 0.000001, "Wrong value. Should be equals to PI")
        XCTAssertEqual(minRadians, -.pi, accuracy: 0.000001, "Wrong value. Should be equals to -PI")
    }
}
