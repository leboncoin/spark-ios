//
//  CGFloat+AngleExtension.swift
//  SparkCommon
//
//  Created by robin.lemaire on 25/11/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Foundation
import Testing
@testable import SparkCommon

@Suite("CG Float Angle Extension Tests")
struct CGFloatAngleExtensionTests {

    @Test("Degrees to radians positive angle")
    func degreesToRadiansPositiveAngle() {
        let angle: CGFloat = 45.0
        let expectedRadians: CGFloat = angle * .pi / 180

        let radians = angle.degreesToRadians

        #expect(abs(radians - (expectedRadians)) <= 0.000001)
    }

    @Test("Degrees to radians negative angle")
    func degreesToRadiansNegativeAngle() {
        let angle: CGFloat = -120.0
        let expectedRadians: CGFloat = angle * .pi / 180

        let radians = angle.degreesToRadians

        #expect(abs(radians - (expectedRadians)) <= 0.000001)
    }

    @Test("Degrees to radians zero angle")
    func degreesToRadiansZeroAngle() {
        let angle: CGFloat = 0.0

        let radians = angle.degreesToRadians

        #expect(abs(radians - (0.0)) <= 0.000001)
    }

    @Test("Degrees to radians extreme boundaries")
    func degreesToRadiansExtremeBoundaries() {
        let maxDegrees: CGFloat = 180.0
        let minDegrees: CGFloat = -180.0

        let maxRadians = maxDegrees.degreesToRadians
        let minRadians = minDegrees.degreesToRadians

        #expect(abs(maxRadians - (.pi)) <= 0.000001, "Wrong value. Should be equals to PI")
        #expect(abs(minRadians - (-.pi)) <= 0.000001, "Wrong value. Should be equals to -PI")
    }
}
