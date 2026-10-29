//
//  SparkTextLinkSnapshotTests.swift
//  SparkComponentTextLinkSnapshotTests
//
//  Created by robin.lemaire on 28/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
import SwiftUI
import SnapshotTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
@testable import SparkComponentTextLink
@_spi(SI_SPI) import SparkComponentTextLinkTesting
import SparkTheming
import SparkTheme

@MainActor
@Suite(.sparkConfiguration)
struct SparkTextLinkSnapshotTests: SwiftUIComponentSnapshotTesting {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    @Test(arguments: TextLinkScenarioSnapshotTests.allCases)
    func test(scenario: TextLinkScenarioSnapshotTests) async {
        let configurations = scenario.configuration()

        for configuration in configurations {
            let view = SparkTextLink(
                configuration.text.value,
                image: configuration.isImage ? .icon : nil,
                action: {}
            )
                .sparkTheme(self.theme)
                .sparkTextLinkAlignment(configuration.alignment)
                .sparkTextLinkHighlightRange(configuration.text.highlightRange(isRange: configuration.isRange))
                .sparkTextLinkIntent(configuration.intent.toType(self.theme))
                .sparkTextLinkTypography(configuration.typography)
                .sparkTextLinkVariant(configuration.variant)
                .multilineTextAlignment(configuration.textAlignment.toRealType)
                .lineLimit(configuration.singleLine ? 1 : nil)
                .background(.background)
                .fixedSize()

            await self.assertSnapshot(
                matching: view,
                named: configuration.name,
                modes: configuration.modes,
                sizes: configuration.sizes,
                testName: configuration.testName,
                addPadding: false,
                forDocumentation: scenario.isDocumentation
            )
        }
    }
}

// MARK: - Extension

private extension Image {
    static let icon: Image = .init(uiImage: IconographyTests.shared.checkmark)
}

private extension TextLinkTextAlignment {

    var toRealType: TextAlignment {
        switch self {
        case .leading: .leading
        case .trailing: .trailing
        case .center, .default: .center
        }
    }
}
