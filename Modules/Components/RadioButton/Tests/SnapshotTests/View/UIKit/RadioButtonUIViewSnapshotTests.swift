//
//  RadioButtonUIViewSnapshotTests.swift
//  SparkComponentRadioButton
//
//  Created by louis.borlee on 21/10/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Testing
import UIKit
@testable import SparkComponentRadioButton
@testable import SparkTheme
@testable import SparkTheming
@_spi(SI_SPI) @testable import SparkCommon
@_spi(SI_SPI) @testable import SparkCommonTesting
@_spi(SI_SPI) @testable import SparkCommonSnapshotTesting

@Suite(.sparkConfiguration)
struct RadioButtonUIViewSnapshotTests: UIKitComponentSnapshotTesting {

    private let theme: any Theme = SparkTheme.shared

    @Test("1") func test1() async {
        await self._test(.test1)
    }

    @Test("2") func test2() async {
        await self._test(.test2)
    }

    @Test("3") func test3() async {
        await self._test(.test3)
    }

    @Test("4") func test4() async {
        await self._test(.test4)
    }

    @Test("5") func test5() async {
        await self._test(.test5)
    }

    private func _test(_ scenario: RadioButtonScenario) async {
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
                view.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
            ])

            if configuration.hasExpendedContainer {
                NSLayoutConstraint.activate([
                    containerView.widthAnchor.constraint(equalToConstant: 1000),
                    containerView.heightAnchor.constraint(equalToConstant: 1000)
                ])
            } else if configuration.groupLayout == .vertical {
                containerView.widthAnchor.constraint(equalToConstant: 300).isActive = true
            }

            await self.assertSnapshot(
                matching: containerView,
                modes: configuration.modes,
                sizes: configuration.sizes,
                testName: configuration.testName
            )
        }
    }
}
