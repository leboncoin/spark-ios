//
//  SparkButtonSnapshotTests.swift
//  SparkComponentButtonSnapshotTests
//
//  Created by robin.lemaire on 17/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
import SnapshotTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
@testable import SparkComponentButton
import SparkTheming
import SparkTheme

final class SparkButtonSnapshotTests: SwiftUIComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() {
        let scenarios = ButtonScenarioSnapshotTests.allCases

        for scenario in scenarios {
            let configurations = scenario.configuration()

            for configuration in configurations {

                let view = self.component(configuration: configuration)
                    .sparkTheme(self.theme)
                    .appearance(configuration: configuration)
                    .sparkButtonIntent(configuration.intent)
                    .sparkButtonVariant(configuration.variant)
                    .sparkButtonShape(configuration.shape)
                    .sparkButtonSize(configuration.size)
                    .sparkButtonAlignment(configuration.alignment)
                    .sparkButtonContentVisibility(configuration.contentVisibility)
                    .sparkButtonRemoveStyles(configuration.removeStyles)
                    .sparkButtonMaxWidth(configuration.isInfiniteWidth ? .infinity : nil)
                    .disabled(configuration.isDisabled)
                    .frame(
                        width: configuration.isInfiniteWidth ? 300 : nil,
                        height: configuration.removeStyles ? 80 : nil
                    )
                    .padding(.vertical, 30)
                    .padding(.horizontal, 50)
                    .fixedSize()
                    .background(.background)

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
    private func component(configuration: ButtonConfigurationSnapshotTests) -> some View {
        switch (configuration.titleType, configuration.iconType) {
        // Title only
        case (.native, .none):
            self.componentWithNativeTitle()

        case (.custom, .none):
            self.componentWithCustomTitle()

        // Icon only
        case (.none, .native):
            self.componentWithNativeIcon()

        case (.none, .custom):
            self.componentWithCustomIcon()

        // Title and Icon - all combinations
        case (.native, .native):
            self.componentWithNativeTitleAndNativeIcon()

        case (.native, .custom):
            self.componentWithNativeTitleAndCustomIcon()

        case (.custom, .native):
            self.componentWithCustomTitleAndNativeIcon()

        case (.custom, .custom):
            self.componentWithCustomTitleAndCustomIcon()

        // None/None should not happen but handle it
        case (.none, .none):
            Text("Not possible !")
        }
    }

    // MARK: - Title Only

    @ViewBuilder
    private func componentWithNativeTitle() -> some View {
        SparkButton(String.mock) {
            // Action
        }
    }

    @ViewBuilder
    private func componentWithCustomTitle() -> some View {
        SparkButton {
            // Action
        } label: {
            CustomLabelView(text: .mock)
        }
    }

    // MARK: - Icon Only

    @ViewBuilder
    private func componentWithNativeIcon() -> some View {
        SparkButton(Image.mock) {
            // Action
        }
    }

    @ViewBuilder
    private func componentWithCustomIcon() -> some View {
        SparkButton {
            // Action
        } image: {
            SparkButtonImage(image: .mock)
        }
    }

    // MARK: - Title and Icon

    @ViewBuilder
    private func componentWithNativeTitleAndNativeIcon() -> some View {
        SparkButton(
            .mock,
            image: .mock
        ) {
            // Action
        }
    }

    @ViewBuilder
    private func componentWithNativeTitleAndCustomIcon() -> some View {
        SparkButton(
            .mock,
            action: {
                // Action
            },
            image: {
                SparkButtonImage(image: .mock)
            }
        )
    }

    @ViewBuilder
    private func componentWithCustomTitleAndNativeIcon() -> some View {
        SparkButton(
            .mock,
            action: {
                // Action
            },
            label: {
                CustomLabelView(text: .mock)
            }
        )
    }

    @ViewBuilder
    private func componentWithCustomTitleAndCustomIcon() -> some View {
        SparkButton(
            action: {
                // Action
            },
            label: {
                CustomLabelView(text: .mock)
            },
            image: {
                SparkButtonImage(image: .mock)
            }
        )
    }
}

// MARK: - Button Extension

private extension View {

    @ViewBuilder
    func appearance(configuration: ButtonConfigurationSnapshotTests) -> some View {
        if let appearance = configuration.appearance {
            self.sparkButtonAppearance(appearance)
        } else {
            self
        }
    }
}

// MARK: - Image Extension

private extension Image {
    static var mock: Image {
        Image(systemName: "heart.fill")
    }
}

// MARK: - Custom Label View

private struct CustomLabelView: View {
    let text: String

    var body: some View {
        HStack {
            Text(self.text)
            Text("(*)")
                .bold()
                .foregroundColor(.blue)
        }
    }
}
