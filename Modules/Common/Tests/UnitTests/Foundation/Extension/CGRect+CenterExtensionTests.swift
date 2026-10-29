//
//  CGRect+CenterExtensionTests.swift
//  SparkCoreUnitTests
//
//  Created by Michael Zimmermann on 30.11.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
import Testing

@_spi(SI_SPI) @testable import SparkCommon

@Suite("CG Rect Center Tests")
struct CGRectCenterTests {

    @Test("Example")
    func example() throws {
        let rect = CGRect(x: 10, y: 10, width: 110, height: 30)

        #expect(rect.centerX == 65, "CenterX doesn't match expected value")
        #expect(rect.centerY == 25, "CenterY doesn't match expected value")

        #expect(rect.center == CGPoint(x: 65, y: 25), "Center point is not correct")
    }

}
