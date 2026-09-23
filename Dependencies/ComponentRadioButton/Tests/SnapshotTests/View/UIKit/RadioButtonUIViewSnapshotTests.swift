//
//  RadioButtonUIViewSnapshotTests.swift
//  SparkComponentRadioButton
//
//  Created by louis.borlee on 21/10/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import XCTest
import UIKit
@testable import SparkComponentRadioButton
@testable import SparkTheme
@testable import SparkTheming
@_spi(SI_SPI) @testable import SparkCommon
@_spi(SI_SPI) @testable import SparkCommonTesting
@_spi(SI_SPI) @testable import SparkCommonSnapshotTesting

final class RadioButtonUIViewSnapshotTests: UIKitComponentSnapshotTestCase  {

    private let theme: any Theme = SparkTheme.shared

    func test1() {
        self._test(.test1)
    }

    func test2() {
        self._test(.test2)
    }

    func test3() {
        self._test(.test3)
    }

    func test4() {
        self._test(.test4)
    }

    func test5() {
        self._test(.test5)
    }

    private func _test(_ scenario: RadioButtonScenario) {
        for configuration in scenario.configurations {
            let view = RadioButtonUIGroupView(
                theme: self.theme,
                intent: configuration.intent,
                selectedID: configuration.radioButtons.firstIndex(where: \.isSelected),
                items: configuration.radioButtons.enumerated().map { index, radioButton in
                    return .init(id: index, label: radioButton.text)
                },
                labelAlignment: configuration.labelAlignment,
                groupLayout: configuration.groupLayout
            )
            view.translatesAutoresizingMaskIntoConstraints = false
            for (index, radioButton) in configuration.radioButtons.enumerated() {
                if configuration.showTapArea {
                    view.radioButtonViews[index].backgroundColor = .green
                }
                view.radioButtonViews[index].isEnabled = radioButton.isEnabled
                view.radioButtonViews[index].isHighlighted = radioButton.isHighlighted
            }
            view.backgroundColor = self.theme.colors.base.surface.uiColor
            let containerView = UIView()
            containerView.translatesAutoresizingMaskIntoConstraints = false
            containerView.backgroundColor = self.theme.colors.base.surfaceInverse.uiColor
            containerView.addSubview(view)
            NSLayoutConstraint.activate([
                view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
                view.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12),
                view.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
                view.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            ])

            if configuration.hasExpendedContainer {
                NSLayoutConstraint.activate([
                    containerView.widthAnchor.constraint(equalToConstant: 1000),
                    containerView.heightAnchor.constraint(equalToConstant: 1000)
                ])
            } else if configuration.groupLayout == .vertical {
                containerView.widthAnchor.constraint(equalToConstant: 300).isActive = true
            }

            self.assertSnapshot(
                matching: containerView,
                modes: configuration.modes,
                sizes: configuration.sizes,
                testName: configuration.testName
            )
        }
    }
}
