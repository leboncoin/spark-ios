//
//  CheckboxViewSnapshotTests.swift
//  SparkComponentCheckboxSnapshotTests
//
//  Created by alican.aycil on 12.01.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Testing
import SwiftUI

@testable import SparkComponentCheckbox
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkThemingTesting
import SparkTheming
import SparkTheme

@MainActor
@Suite(.sparkConfiguration)
struct CheckboxViewSnapshotTests: SwiftUIComponentSnapshotTesting {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    @Test(arguments: CheckboxScenarioSnapshotTests.allCases)
    func test(scenario: CheckboxScenarioSnapshotTests) async {
        let configurations = scenario.configuration(isSwiftUIComponent: true)

        for configuration in configurations {
            let checkboxView = CheckboxView(
                text: configuration.textType.value,
                checkedImage: Image(uiImage: configuration.image),
                alignment: configuration.alignment,
                theme: self.theme,
                intent: configuration.intent,
                isEnabled: configuration.state == .disabled ? false : true,
                selectionState: .constant(configuration.selectionState)
            )
            .background(Color(UIColor.systemBackground))
            .disabled(configuration.state == .disabled)

            let view = self.view(text: configuration.textType.value, checkbox: checkboxView)

            await self.assertSnapshot(
                matching: view,
                modes: configuration.modes,
                sizes: configuration.sizes,
                testName: configuration.testName(),
                addPadding: false
            )
        }
    }

    func view(text: String, checkbox: some View) -> AnyView {
        if text != "Hello World" {
            let view = VStack { checkbox }
                .frame(width: UIScreen.main.bounds.width)
            return AnyView(view)
        } else {
            return AnyView(checkbox.fixedSize())
        }

    }
}
