//
//  FormFieldViewSnapshotTests.swift
//  SparkComponentFormFieldSnapshotTests
//
//  Created by alican.aycil on 14.04.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import SwiftUI
@testable import SparkComponentFormField
@_spi(SI_SPI) import SparkCommonSnapshotTesting
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import SparkTheme

final class FormFieldViewSnapshotTests: SwiftUIComponentSnapshotTestCase {

    // MARK: - Type Alias

    private typealias Constants = FormFieldSnapshotConstants

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() {
        let scenarios = FormFieldScenarioSnapshotTests.allCases

        var _isOn: Bool = true
        lazy var isOn: Binding<Bool> = {
            return Binding<Bool>(
                get: { return _isOn },
                set: { newValue in
                    _isOn = newValue
                }
            )
        }()

        for scenario in scenarios {
            let configurations = scenario.configuration()

            for configuration in configurations {

                let view = FormFieldView(
                    theme: self.theme,
                    feedbackState: configuration.feedbackState,
                    title: configuration.titleType.value(from: .title),
                    helper: configuration.helperType.value(from: .helper),
                    helperImage: Image(configuration.helperImageName),
                    isRequired: configuration.isRequired,
                    component: {
                        TextField("Your username", text: .constant(""))
                            .textFieldStyle(.roundedBorder)
                    }
                )
                .clearButton(on: configuration)
                .counter(on: configuration)
                .disabled(!configuration.isEnabled)
                .background(.background)
                .frame(width: Constants.maxWidth)
                .padding(Constants.padding)
                .fixedSize(horizontal: false, vertical: true)
                .background(Color(uiColor: .secondarySystemBackground))

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

// MARK: - Extension

private extension FormFieldView {

    func clearButton(on configuration: FormFieldConfigurationSnapshotTests) -> Self {
        return if let image = Image(configuration.clearButtonImageName) {
            self.clearButton(icon: image, action: {})
        } else {
            self
        }
    }

    func counter(on configuration: FormFieldConfigurationSnapshotTests) -> Self {
        return if configuration.isCounter {
            self.counter(
                on: FormFieldSnapshotConstants.Counter.text,
                limit: FormFieldSnapshotConstants.Counter.limit
            )
        } else {
            self
        }
    }
}

private extension Image {

    init?(_ imageName: String?) {
        guard let imageName else {
            return nil
        }

        self.init(systemName: imageName)
    }
}
