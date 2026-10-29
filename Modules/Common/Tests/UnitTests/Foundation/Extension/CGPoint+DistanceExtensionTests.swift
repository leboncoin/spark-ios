//
//  CGPoint+DistanceExtensionTests.swift
//  SparkCoreUnitTests
//
//  Created by Michael Zimmermann on 30.11.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
import Testing

@_spi(SI_SPI) @testable import SparkCommon

@Suite("CG Point Distance Tests")
struct CGPointDistanceTests {

    @Test("Distance same")
    func distanceSame() throws {
        let point1 = CGPoint(x: 10, y: 10)
        let point2 = CGPoint(x: 10, y: -100)

        let distance1 = point1.distance(to: point2)
        let distance2 = point2.distance(to: point1)

        #expect(distance1 == 110.0, "Expected distance does not match")
        #expect(distance1 == distance2, "Expected both distances to be the same")
    }
}
