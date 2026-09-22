//
//  CircularMeterTextAlignmentTests.swift
//  SparkComponentCircularMeterTests
//
//  Created by robin.lemaire on 28/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentCircularMeter
import SwiftUI
import Testing

@Suite("Circular Meter Text Alignment Tests")
struct CircularMeterTextAlignmentTests {

    // MARK: - Tests

    @Test("Leading case exists")
    func leadingCaseExists() {
        // GIVEN
        let alignment = CircularMeterTextAlignment.leading

        // WHEN / THEN
        #expect(alignment == .leading)
    }

    @Test("Center case exists")
    func centerCaseExists() {
        // GIVEN
        let alignment = CircularMeterTextAlignment.center

        // WHEN / THEN
        #expect(alignment == .center)
    }

    @Test("Default value is leading")
    func defaultValueIsLeading() {
        // GIVEN / WHEN / THEN
        #expect(CircularMeterTextAlignment.default == .leading)
    }

    @Test("SwiftUI alignment for leading returns leading")
    func swiftUIAlignmentForLeadingReturnsLeading() {
        // GIVEN
        let alignment = CircularMeterTextAlignment.leading

        // WHEN
        let swiftUIAlignment = alignment.swiftUIAlignement

        // THEN
        #expect(swiftUIAlignment == .leading)
    }

    @Test("SwiftUI alignment for center returns center")
    func swiftUIAlignmentForCenterReturnsCenter() {
        // GIVEN
        let alignment = CircularMeterTextAlignment.center

        // WHEN
        let swiftUIAlignment = alignment.swiftUIAlignement

        // THEN
        #expect(swiftUIAlignment == .center)
    }
}
