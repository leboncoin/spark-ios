//
//  UIView+ClosestExtensionTests.swift
//  SparkCoreUnitTests
//
//  Created by Michael Zimmermann on 30.11.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import UIKit
import Testing
@_spi(SI_SPI) @testable import SparkCommon

@MainActor
@Suite("UI View Closest Tests")
struct UIViewClosestTests {

    @Test("Closest")
    func closest() throws {
        let positions = [0, 100, 200, 300]
        let views = positions.map{ CGRect(x: $0, y: 10, width: 50, height: 50) }.map(UIView.init(frame:))

        for (index, position) in positions.enumerated() {
            let closestIndex = views.index(closestTo: CGPoint(x: position + 50, y: 100))
            #expect(closestIndex == index, "Expected \(String(describing: closestIndex)) to be equal to \(index)")
        }
    }

}
