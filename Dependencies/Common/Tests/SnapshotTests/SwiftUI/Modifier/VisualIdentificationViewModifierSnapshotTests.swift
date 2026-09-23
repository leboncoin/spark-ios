//
//  VisualIdentificationViewModifierSnapshotTests.swift
//  SparkCommon
//
//  Created by robin.lemaire on 28/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import XCTest
@testable import SparkCommon
@_spi(SI_SPI) @testable import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonTesting

final class VisualIdentificationViewModifierSnapshotTests: SwiftUIComponentSnapshotTestCase {

    // MARK: - Tests

    func test_sparkVisualIdentification_when_toggle_is_true() throws {
        // GIVEN
        let featureTogglesService = SparkFeatureToggleServicingGeneratedMock()
        featureTogglesService.visualIdentification = true

        let view = Text("Hello World")
            .sparkVisualIdentification(featureTogglesService: featureTogglesService)
            .style()

        // THEN
        self.assertSnapshot(
            matching: view,
            modes: ComponentSnapshotTestConstants.Modes.default,
            sizes: ComponentSnapshotTestConstants.Sizes.default
        )
    }

    func test_sparkVisualIdentification_when_toggle_is_false() throws {
        // GIVEN
        let featureTogglesService = SparkFeatureToggleServicingGeneratedMock()
        featureTogglesService.visualIdentification = false

        let view = Text("Hello World")
            .sparkVisualIdentification(featureTogglesService: featureTogglesService)
            .style()

        // THEN
        self.assertSnapshot(
            matching: view,
            modes: ComponentSnapshotTestConstants.Modes.default,
            sizes: ComponentSnapshotTestConstants.Sizes.default
        )
    }

    func test_sparkVisualIdentification_with_default_toggle_service() throws {
        // GIVEN
        let view = Text("Hello World")
            .sparkVisualIdentification()
            .style()

        // THEN
        self.assertSnapshot(
            matching: view,
            modes: ComponentSnapshotTestConstants.Modes.default,
            sizes: ComponentSnapshotTestConstants.Sizes.default
        )
    }
}

// MARK: - Extension

private extension View {

    func style() -> some View {
        self.frame(width: 120, height: 40)
            .background(.white)
    }
}
