//
//  SwitchUIViewSnapshotTests.swift
//  SparkComponentSwitchSnapshotTests
//
//  Created by robin.lemaire on 02/10/2024.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import XCTest
import SnapshotTesting
@testable import SparkComponentSwitch
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonTesting
@_spi(SI_SPI) import SparkThemingTesting
import SparkTheming
import SparkTheme

final class SwitchUIViewSnapshotTests: UIKitComponentSnapshotTestCase {

    // MARK: - Type Alias

    private typealias Constants = SwitchSnapshotConstants

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() throws {
        let scenarios = SwitchScenarioSnapshotTests.allCases

        for scenario in scenarios {
            let configurations: [SwitchConfigurationSnapshotTests] = try scenario.configuration()
            for configuration in configurations {
                var view: SwitchUIView!

                let text = configuration.content.text
                let attributedText = configuration.content.attributedLabel(isSwiftUIComponent: false)?.leftValue

                // Images + Text
                if configuration.isIcon, let text {
                    view = SwitchUIView(
                        theme: self.theme,
                        isOn: configuration.value.isOn,
                        alignment: configuration.alignment,
                        intent: configuration.intent,
                        isEnabled: configuration.status.isEnabled,
                        images: UIImage.images,
                        text: text
                    )
                } else if configuration.isIcon, let attributedText { // Images + Attributed Text
                    view = SwitchUIView(
                        theme: self.theme,
                        isOn: configuration.value.isOn,
                        alignment: configuration.alignment,
                        intent: configuration.intent,
                        isEnabled: configuration.status.isEnabled,
                        images: UIImage.images,
                        attributedText: attributedText
                    )
                } else if configuration.isIcon { // Only Image
                    view = SwitchUIView(
                        theme: self.theme,
                        isOn: configuration.value.isOn,
                        alignment: configuration.alignment,
                        intent: configuration.intent,
                        isEnabled: configuration.status.isEnabled,
                        images: UIImage.images
                    )
                } else if let text { // Only Text
                    view = SwitchUIView(
                        theme: self.theme,
                        isOn: configuration.value.isOn,
                        alignment: configuration.alignment,
                        intent: configuration.intent,
                        isEnabled: configuration.status.isEnabled,
                        text: text
                    )
                } else if let attributedText { // Only Attributed Text
                    view = SwitchUIView(
                        theme: self.theme,
                        isOn: configuration.value.isOn,
                        alignment: configuration.alignment,
                        intent: configuration.intent,
                        isEnabled: configuration.status.isEnabled,
                        attributedText: attributedText
                    )
                } else { // Without image and text
                    view = SwitchUIView(
                        theme: self.theme,
                        isOn: configuration.value.isOn,
                        alignment: configuration.alignment,
                        intent: configuration.intent,
                        isEnabled: configuration.status.isEnabled
                    )
                }

                view.backgroundColor = .secondarySystemBackground

                let backgroundView = UIView()
                backgroundView.backgroundColor = .systemBackground
                backgroundView.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    backgroundView.widthAnchor.constraint(lessThanOrEqualToConstant: Constants.maxWidth)
                ])
                backgroundView.addSubview(view)
                NSLayoutConstraint.stickEdges(
                    from: view,
                    to: backgroundView,
                    insets: .init(all: Constants.padding)
                )

                self.assertSnapshot(
                    matching: backgroundView,
                    modes: configuration.modes,
                    sizes: configuration.sizes,
                    testName: configuration.testName()
                )
            }
        }
    }
}

// MARK: - Extension

private extension UIImage {

    static var images: SwitchUIImages {
        get {
            .init(
                on: IconographyTests.shared.switchOn,
                off: IconographyTests.shared.switchOff
            )
        }
    }
}
