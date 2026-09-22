//
//  ScaledFrameTests.swift
//  SparkCommonTests
//
//  Created on 23/04/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//
import XCTest
import SwiftUI
@testable import SparkCommon

final class ScaledFrameTests: XCTestCase {

    // MARK: - Tests Inits

    func test_init_without_value() {
        // GIVEN / WHEN
        let metric = ScaledFrame(value: nil, relativeTo: .largeTitle)

        // THEN
        XCTAssertNil(metric.wrappedValue)
    }

    func test_init_with_value() {
        // GIVEN
        let baseValue: CGFloat = 10

        // WHEN
        let metric = ScaledFrame(value: baseValue, relativeTo: .largeTitle)

        // THEN
        XCTAssertEqual(metric.wrappedValue, baseValue)
    }
}
