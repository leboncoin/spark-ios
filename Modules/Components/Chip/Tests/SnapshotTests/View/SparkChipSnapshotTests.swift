//
//  SparkChipSnapshotTests.swift
//  SparkComponentChipSnapshotTests
//
//  Created by robin.lemaire on 02/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
import SnapshotTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
@testable import SparkComponentChip
import SparkTheming
import SparkTheme

final class SparkChipSnapshotTests: SwiftUIComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() {
        let scenarios = ChipScenarioSnapshotTests.allCases

        for scenario in scenarios {
            let configurations = scenario.configuration()

            for configuration in configurations {
                let view = self.components(configuration: configuration)
                    .sparkTheme(self.theme)
                    .sparkChipAlignment(configuration.alignment)
                    .sparkChipIntent(configuration.intent)
                    .sparkChipVariant(configuration.variant)
                    .sparkChipSize(configuration.size)
                    .sparkIsSelected(configuration.isSelected)
                    .disabled(configuration.isDisabled)
                    .padding(.horizontal, 30)
                    .padding(.vertical, 30)
                    .background(.background)
                    .fixedSize()

                self.assertSnapshot(
                    matching: view,
                    named: configuration.name,
                    modes: configuration.modes,
                    sizes: configuration.sizes,
                    testName: configuration.testName,
                    forDocumentation: scenario.isDocumentation
                )
            }
        }
    }

    @ViewBuilder
    private func components(configuration: ChipConfigurationSnapshotTests) -> some View {

        if let text = configuration.label.text {

            if configuration.isBadge {
                SparkChip(
                    text,
                    icon: configuration.isIcon ? .icon : nil,
                    action: nil,
                    extraContent: { ExtraContentView() }
                )

            } else {
                SparkChip(
                    text,
                    icon: configuration.isIcon ? .icon : nil,
                    action: nil
                )
            }

        } else if configuration.label == .other {

            if configuration.isBadge {
                SparkChip(
                    icon: configuration.isIcon ? .icon : nil,
                    action: nil,
                    label: { OtherContentView() },
                    extraContent: { ExtraContentView() }
                )

            } else {
                SparkChip(
                    icon: configuration.isIcon ? .icon : nil,
                    action: nil,
                    label: { OtherContentView() }
                )
            }

        } else if configuration.isBadge {
            SparkChip(
                icon: configuration.isIcon ? .icon : nil,
                action: nil,
                extraContent: { ExtraContentView() }
            )

        } else {
            SparkChip(
                icon: .icon,
                action: nil
            )
        }
    }
}

// MARK: - Extension

extension Image {
    static let icon: Image = .init(uiImage: IconographyTests.shared.checkmark)
}

struct OtherContentView: View {
    var body: some View {
        HStack {
            Text("Welcome")
            Text("on Spark's Chip")
                .foregroundColor(.blue)
        }
    }
}

struct ExtraContentView: View {
    var body: some View {
        Text("99")
            .font(.body)
            .bold()
            .foregroundStyle(.red)
            .padding(4)
            .background(.yellow)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
