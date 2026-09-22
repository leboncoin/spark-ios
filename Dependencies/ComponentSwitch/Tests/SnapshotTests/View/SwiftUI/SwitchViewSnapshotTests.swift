//
//  SwitchViewSnapshotTests.swift
//  SparkComponentSwitchSnapshotTests
//
//  Created by robin.lemaire on 02/10/2024.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import XCTest
import SnapshotTesting
@testable import SparkComponentSwitch
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonTesting
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkThemingTesting
import SparkTheming
import SparkTheme
import SwiftUI

final class SwitchViewSnapshotTests: SwiftUIComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() throws {
        let scenarios = SwitchScenarioSnapshotTests.allCases

        for scenario in scenarios {
            let configurations: [SwitchConfigurationSnapshotTests] = try scenario.configuration()

            for configuration in configurations {
                let view = SnapshotView(configuration: configuration)

                self.assertSnapshot(
                    matching: view,
                    modes: configuration.modes,
                    sizes: configuration.sizes,
                    testName: configuration.testName()
                )
            }
        }
    }
}

// MARK: - View

private struct SnapshotView: View {

    // MARK: - Type Alias

    private typealias Constants = SwitchSnapshotConstants

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared
    let configuration: SwitchConfigurationSnapshotTests

    // MARK: - Initialization

    init(configuration: SwitchConfigurationSnapshotTests) {
        self.configuration = configuration
    }

    // MARK: - View

    var body: some View {
        SwitchView(
            theme: self.theme,
            intent: self.configuration.intent,
            alignment: self.configuration.alignment,
            isOn: .constant(self.configuration.value.isOn)
        )
        .images(isIcon: self.configuration.isIcon)
        .text(contentResilience: self.configuration.content)
        .disabled(!self.configuration.status.isEnabled)
        .background(Color(uiColor: .secondarySystemBackground))
        .padding(Constants.padding)
        .fixedSize()
        .background(.background)
    }
}

// MARK: - Extension

private extension SwitchView {

    func images(isIcon: Bool) -> Self {
        if isIcon {
            self.images(Image.images)
        } else {
            self
        }
    }

    func text(contentResilience: SwitchContentResilience) -> Self {
        if let text = contentResilience.text {
            self.text(text)
        } else if let attributedText = contentResilience.attributedLabel(isSwiftUIComponent: true) {
            self.attributedText(attributedText.rightValue)
        } else {
            self
        }
    }
}

private extension Image {

    static let images: SwitchImages = .init(
        on: Image(systemName: "checkmark"),
        off: Image(systemName: "xmark")
    )
}
