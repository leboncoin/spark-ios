//
//  CheckboxGroupViewSnapshotTests.swift
//  SparkComponentCheckboxSnapshotTests
//
//  Created by alican.aycil on 16.01.24.
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
struct CheckboxGroupViewSnapshotTests: SwiftUIComponentSnapshotTesting {

    // MARK: - Tests

    @Test("Checkbox group view snapshot", arguments: CheckboxGroupScenarioSnapshotTests.allCases)
    func test(scenario: CheckboxGroupScenarioSnapshotTests) async {
        let configurations = scenario.configuration()

        for configuration in configurations {

            let view = CheckboxGroupContainerView(configuration: configuration)
            .fixedSize()

            await self.assertSnapshot(
                matching: view,
                modes: configuration.modes,
                sizes: configuration.sizes,
                testName: configuration.testName(),
                addPadding: false
            )
        }
    }
}

private struct CheckboxGroupContainerView: View {

    private let theme: any Theme = SparkTheme.shared
    let configuration: CheckboxGroupConfigurationSnapshotTests

    @Binding var items: [any CheckboxGroupItemProtocol]
    @State var viewHeight: CGFloat = 0

    init(configuration: CheckboxGroupConfigurationSnapshotTests) {
        self.configuration = configuration
        self._items = .constant(configuration.items)
    }

    var body: some View {
        VStack {
            CheckboxGroupView(
                checkedImage: Image(uiImage: configuration.image),
                items: self.$items,
                layout: configuration.axis,
                alignment: configuration.alignment,
                theme: self.theme,
                intent: configuration.intent,
                accessibilityIdentifierPrefix: "id"
            )
            .background(Color(UIColor.systemBackground))
            .frame(width: UIScreen.main.bounds.width)
            .overlay(
                GeometryReader { geo in
                    Color.clear.onAppear {
                        self.viewHeight = geo.size.height
                    }
                }
            )
        }
        .frame(height: self.viewHeight)
    }
}
