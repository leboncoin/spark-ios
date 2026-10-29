//
//  CGRect+LocationExtensionTests.swift
//  SparkCoreUnitTests
//
//  Created by Michael Zimmermann on 08.12.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
import Testing

@_spi(SI_SPI) @testable import SparkCommon

@Suite("CG Rect Location Tests")
struct CGRectLocationTests {

    @Test("Last element")
    func lastElement() throws {
        let sut = CGRect(x: 0, y: 0, width: 100, height: 20)

        #expect(sut.pointIndex(of: CGPoint(x: 0, y: 0), horizontalSlices: 5) == 0, "Expected to be index 0")
        #expect(sut.pointIndex(of: CGPoint(x: 80, y: 0), horizontalSlices: 5) == 3, "Expected to be index 3")
        #expect(sut.pointIndex(of: CGPoint(x: 81, y: 0), horizontalSlices: 5) == 4, "Expected to be index 4")
        #expect(sut.pointIndex(of: CGPoint(x: 99, y: 0), horizontalSlices: 5) == 4, "Expected to be index 4")
    }

    @Test("Edge cases")
    func edgeCases() throws {
        let sut = CGRect(x: 0, y: 0, width: 100, height: 20)

        #expect(sut.pointIndex(of: CGPoint(x: 99, y: 0), horizontalSlices: 0) == nil, "Expected not to have an index")
        #expect(sut.pointIndex(of: CGPoint(x: 101, y: 10), horizontalSlices: 5) == nil, "Expected point outside of frame to have no index")
    }
}
