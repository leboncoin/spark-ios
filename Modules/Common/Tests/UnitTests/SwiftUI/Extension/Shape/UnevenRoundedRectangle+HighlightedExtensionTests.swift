//
//  UnevenRoundedRectangle+HighlightedExtensionTests.swift
//  SparkCommon
//
//  Created by robin.lemaire on 03/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
import SwiftUI
@_spi(SI_SPI) @testable import SparkCommon

@MainActor
@Suite("Uneven Rounded Rectangle Highlighted Extension Tests")
struct UnevenRoundedRectangleHighlightedExtensionTests {

    // MARK: - Tests

    @Test("Init with individual radii not highlighted")
    func initWithIndividualRadiiNotHighlighted() {
        // GIVEN/WHEN
        let shape = UnevenRoundedRectangle(
            topLeadingRadius: 5.0,
            bottomLeadingRadius: 10.0,
            bottomTrailingRadius: 15.0,
            topTrailingRadius: 20.0,
            isHighlighted: false,
            style: .continuous
        )

        // THEN
        #expect(shape.cornerRadii.topLeading == 5.0, "Wrong topLeading value")
        #expect(shape.cornerRadii.bottomLeading == 10.0, "Wrong bottomLeading value")
        #expect(shape.cornerRadii.bottomTrailing == 15.0, "Wrong bottomTrailing value")
        #expect(shape.cornerRadii.topTrailing == 20.0, "Wrong topTrailing value")
        #expect(shape.style == .continuous, "Wrong style value")
    }

    @Test("Init with individual radii highlighted")
    func initWithIndividualRadiiHighlighted() {
        // GIVEN/WHEN
        let shape = UnevenRoundedRectangle(
            topLeadingRadius: 5.0,
            bottomLeadingRadius: 10.0,
            bottomTrailingRadius: 15.0,
            topTrailingRadius: 20.0,
            isHighlighted: true,
            style: .continuous
        )

        // THEN
        #expect(shape.cornerRadii.topLeading == 5.0, "Wrong topLeading value")
        #expect(shape.cornerRadii.bottomLeading == 0.0, "Wrong bottomLeading value when highlighted")
        #expect(shape.cornerRadii.bottomTrailing == 15.0, "Wrong bottomTrailing value")
        #expect(shape.cornerRadii.topTrailing == 20.0, "Wrong topTrailing value")
        #expect(shape.style == .continuous, "Wrong style value")
    }

    @Test("Init with individual radii default style")
    func initWithIndividualRadiiDefaultStyle() {
        // GIVEN/WHEN
        let shape = UnevenRoundedRectangle(
            topLeadingRadius: 8.0,
            bottomLeadingRadius: 12.0,
            bottomTrailingRadius: 16.0,
            topTrailingRadius: 20.0,
            isHighlighted: false
        )

        // THEN
        #expect(shape.cornerRadii.topLeading == 8.0, "Wrong topLeading value")
        #expect(shape.cornerRadii.bottomLeading == 12.0, "Wrong bottomLeading value")
        #expect(shape.cornerRadii.bottomTrailing == 16.0, "Wrong bottomTrailing value")
        #expect(shape.cornerRadii.topTrailing == 20.0, "Wrong topTrailing value")
        #expect(shape.style == .circular, "Wrong default style value")
    }

    @Test("Init with individual zero radii highlighted")
    func initWithIndividualZeroRadiiHighlighted() {
        // GIVEN/WHEN
        let shape = UnevenRoundedRectangle(
            topLeadingRadius: 3.0,
            bottomLeadingRadius: 5.0,
            bottomTrailingRadius: 0.0,
            topTrailingRadius: 7.0,
            isHighlighted: true,
            style: .circular
        )

        // THEN
        #expect(shape.cornerRadii.topLeading == 3.0, "Wrong topLeading value")
        #expect(shape.cornerRadii.bottomLeading == 0.0, "Wrong bottomLeading value when highlighted")
        #expect(shape.cornerRadii.bottomTrailing == 0.0, "Wrong bottomTrailing value")
        #expect(shape.cornerRadii.topTrailing == 7.0, "Wrong topTrailing value")
        #expect(shape.style == .circular, "Wrong style value")
    }

    @Test("Init with zero bottom leading radius highlighted")
    func initWithZeroBottomLeadingRadiusHighlighted() {
        // GIVEN/WHEN
        let shape = UnevenRoundedRectangle(
            topLeadingRadius: 10.0,
            bottomLeadingRadius: 0.0,
            bottomTrailingRadius: 8.0,
            topTrailingRadius: 12.0,
            isHighlighted: true,
            style: .circular
        )

        // THEN
        #expect(shape.cornerRadii.topLeading == 10.0, "Wrong topLeading value")
        #expect(shape.cornerRadii.bottomLeading == 0.0, "Wrong bottomLeading value when highlighted")
        #expect(shape.cornerRadii.bottomTrailing == 8.0, "Wrong bottomTrailing value")
        #expect(shape.cornerRadii.topTrailing == 12.0, "Wrong topTrailing value")
        #expect(shape.style == .circular, "Wrong style value")
    }
}
