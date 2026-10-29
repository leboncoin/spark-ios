//
//  ScaledFrameTests.swift
//  SparkCommonTests
//
//  Created on 23/04/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//
import Testing
import SwiftUI
@testable import SparkCommon

@MainActor
@Suite("Scaled Frame Tests")
struct ScaledFrameTests {

    // MARK: - Tests Inits

    @Test("Init without value")
    func initWithoutValue() {
        // GIVEN / WHEN
        let metric = ScaledFrame(value: nil, relativeTo: .largeTitle)

        // THEN
        #expect(metric.wrappedValue == nil)
    }

    @Test("Init with value")
    func initWithValue() {
        // GIVEN
        let baseValue: CGFloat = 10

        // WHEN
        let metric = ScaledFrame(value: baseValue, relativeTo: .largeTitle)

        // THEN
        #expect(metric.wrappedValue == baseValue)
    }
}
