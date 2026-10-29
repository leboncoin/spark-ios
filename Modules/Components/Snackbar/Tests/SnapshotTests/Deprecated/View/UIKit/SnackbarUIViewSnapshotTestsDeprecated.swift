//
//  SnackbarUIViewSnapshotTestsDeprecated.swift
//  SparkComponentSnackbarTests
//
//  Created by louis.borlee on 01/10/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Testing
import UIKit
import SparkComponentButton
@testable import SparkTheme
@testable import SparkTheming
@_spi(SI_SPI) @testable import SparkCommon
@_spi(SI_SPI) @testable import SparkCommonTesting
@_spi(SI_SPI) @testable import SparkCommonSnapshotTesting

@testable import SparkComponentSnackbar

@Suite(.sparkConfiguration)
struct SnackbarUIViewSnapshotTestsDeprecated: UIKitComponentSnapshotTesting {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    @Test func test1() async {
        await self._test(.test1)
    }

    @Test func test2() async {
        await self._test(.test2)
    }

    @Test func test3() async {
        await self._test(.test3)
    }

    private func _test(_ scenario: SnackbarScenarioDeprecated) async {
        for configuration in scenario.configurations {
            let view = SnackbarUIView(
                theme: self.theme,
                intent: configuration.intent
            )
            view.translatesAutoresizingMaskIntoConstraints = false

            view.variant = configuration.variant
            view.type = configuration.type

            view.setImage(configuration.withImage ? .init(systemName: "info.circle") : nil)

            switch configuration.buttonConfiguration {
            case .none: break
            case .shortText(let text), .longText(let text):
                let button = view.addButton()
                button.setTitle(text, for: .normal)
            }

            switch configuration.textConfiguration {
            case .shortText(let text), .longText(let text):
                view.label.text = text
            }

            view.label.numberOfLines = configuration.isTextMultiline ? 0 : 1

            let containerView = UIView()
            containerView.translatesAutoresizingMaskIntoConstraints = false
            containerView.backgroundColor = self.theme.colors.base.background.uiColor
            containerView.addSubview(view)
            NSLayoutConstraint.activate([
                view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
                view.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12),
                view.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
                view.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
                view.widthAnchor.constraint(equalToConstant: 300)
            ])

            await self.assertSnapshot(
                matching: containerView,
                modes: configuration.modes,
                sizes: configuration.sizes,
                testName: configuration.testName
            )
        }
    }
}
