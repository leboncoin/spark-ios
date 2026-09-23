//
//  SparkSliderSnapshotTests.swift
//  SparkComponentSliderSnapshotTests
//
//  Created by robin.lemaire on 27/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
import SnapshotTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
@testable import SparkComponentSlider
import SparkTheming
import SparkTheme

final class SparkSliderSnapshotTests: SwiftUIComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared
    @State var value: Double = 0.5

    // MARK: - Tests

    func test() {
        let scenarios = SliderScenarioSnapshotTests.allCases

        for scenario in scenarios {
            let configurations = scenario.configuration(isSwiftUIComponent: true)

            for configuration in configurations {
                let view = self.component(configuration: configuration)
                    .sparkTheme(self.theme)
                    .sparkSliderIntent(configuration.intent)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 20)
                    .background(.background)
                    .frame(width: 300)

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
    private func component(configuration: SliderConfigurationSnapshotTests) -> some View {
        let step: Double? = configuration.step ? 0.25 : nil

        switch configuration.content {
        case .none:
            self.componentWithoutValues(
                configuration: configuration,
                step: step
            )

        case .title:
            self.componentWithTitle(
                configuration: configuration,
                step: step
            )

        case .value:
            self.componentWithValue(
                configuration: configuration,
                step: step
            )

        case .rangeValues:
            self.componentWithRangeValues(
                configuration: configuration,
                step: step
            )

        case .titleAndValue:
            self.componentWithTitleAndValue(
                configuration: configuration,
                step: step
            )

        case .titleAndRangeValues:
            self.componentWithTitleAndRangeValues(
                configuration: configuration,
                step: step
            )

        case .valueAndRangeValues:
            self.componentWithValueAndRangeValues(
                configuration: configuration,
                step: step
            )

        case .allValues:
            self.componentWithAllValues(
                configuration: configuration,
                step: step
            )
        }
    }

    @ViewBuilder
    private func componentWithoutValues(
        configuration: SliderConfigurationSnapshotTests,
        step: Double?
    ) -> some View {

        if let step {
            SparkSlider(
                value: self.$value,
                in: 0...1,
                step: step
            )
        } else {
            SparkSlider(
                value: self.$value,
                in: 0...1
            )
        }
    }

    @ViewBuilder
    private func componentWithTitle(
        configuration: SliderConfigurationSnapshotTests,
        step: Double?
    ) -> some View {
        let text = "Title"

        switch (configuration.contentType, step) {
        case (.text, let step?):
            SparkSlider(
                value: self.$value,
                in: 0...1,
                step: step,
                title: text
            )
        case (.text, nil):
            SparkSlider(
                value: self.$value,
                in: 0...1,
                title: text
            )

        case (.custom, let step?):
            SparkSlider(
                value: self.$value,
                in: 0...1,
                step: step,
                titleLabel: {
                    OtherContentView(text: text)
                }
            )

        case (.custom, nil):
            SparkSlider(
                value: self.$value,
                in: 0...1,
                titleLabel: {
                    OtherContentView(text: text)
                }
            )
        }
    }

    @ViewBuilder
    private func componentWithValue(
        configuration: SliderConfigurationSnapshotTests,
        step: Double?
    ) -> some View {
        let text = "50%"

        switch (configuration.contentType, step) {
        case (.text, let step?):
            SparkSlider(
                value: self.$value,
                in: 0...1,
                step: step,
                valueText: text
            )
        case (.text, nil):
            SparkSlider(
                value: self.$value,
                in: 0...1,
                valueText: text
            )

        case (.custom, let step?):
            SparkSlider(
                value: self.$value,
                in: 0...1,
                step: step,
                valueLabel: {
                    OtherContentView(text: text)
                }
            )

        case (.custom, nil):
            SparkSlider(
                value: self.$value,
                in: 0...1,
                valueLabel: {
                    OtherContentView(text: text)
                }
            )
        }
    }

    @ViewBuilder
    private func componentWithRangeValues(
        configuration: SliderConfigurationSnapshotTests,
        step: Double?
    ) -> some View {
        let minText = "Min"
        let maxText = "Max"

        switch (configuration.contentType, step) {
        case (.text, let step?):
            SparkSlider(
                value: self.$value,
                in: 0...1,
                step: step,
                minValueText: minText,
                maxValueText: maxText
            )

        case (.text, nil):
            SparkSlider(
                value: self.$value,
                in: 0...1,
                minValueText: minText,
                maxValueText: maxText
            )

        case (.custom, let step?):
            SparkSlider(
                value: self.$value,
                in: 0...1,
                step: step,
                minValueLabel: {
                    OtherContentView(text: minText)
                },
                maxValueLabel: {
                    OtherContentView(text: maxText)
                }
            )

        case (.custom, nil):
            SparkSlider(
                value: self.$value,
                in: 0...1,
                minValueLabel: {
                    OtherContentView(text: minText)
                },
                maxValueLabel: {
                    OtherContentView(text: maxText)
                }
            )
        }
    }

    @ViewBuilder
    private func componentWithTitleAndValue(
        configuration: SliderConfigurationSnapshotTests,
        step: Double?
    ) -> some View {
        let title = "Title"
        let value = "50%"

        switch (configuration.contentType, step) {
        case (.text, let step?):
            SparkSlider(
                value: self.$value,
                in: 0...1,
                step: step,
                title: title,
                valueText: value
            )

        case (.text, nil):
            SparkSlider(
                value: self.$value,
                in: 0...1,
                title: title,
                valueText: value
            )

        case (.custom, let step?):
            SparkSlider(
                value: self.$value,
                in: 0...1,
                step: step,
                titleLabel: {
                    OtherContentView(text: title)
                },
                valueLabel: {
                    OtherContentView(text: value)
                }
            )

        case (.custom, nil):
            SparkSlider(
                value: self.$value,
                in: 0...1,
                titleLabel: {
                    OtherContentView(text: title)
                },
                valueLabel: {
                    OtherContentView(text: value)
                }
            )
        }
    }

    @ViewBuilder
    private func componentWithTitleAndRangeValues(
        configuration: SliderConfigurationSnapshotTests,
        step: Double?
    ) -> some View {
        let title = "Title"
        let minText = "Min"
        let maxText = "Max"

        switch (configuration.contentType, step) {
        case (.text, let step?):
            SparkSlider(
                value: self.$value,
                in: 0...1,
                step: step,
                title: title,
                minValueText: minText,
                maxValueText: maxText
            )

        case (.text, nil):
            SparkSlider(
                value: self.$value,
                in: 0...1,
                title: title,
                minValueText: minText,
                maxValueText: maxText
            )

        case (.custom, let step?):
            SparkSlider(
                value: self.$value,
                in: 0...1,
                step: step,
                titleLabel: {
                    OtherContentView(text: title)
                },
                minValueLabel: {
                    OtherContentView(text: minText)
                },
                maxValueLabel: {
                    OtherContentView(text: maxText)
                }
            )

        case (.custom, nil):
            SparkSlider(
                value: self.$value,
                in: 0...1,
                titleLabel: {
                    OtherContentView(text: title)
                },
                minValueLabel: {
                    OtherContentView(text: minText)
                },
                maxValueLabel: {
                    OtherContentView(text: maxText)
                }
            )
        }
    }

    @ViewBuilder
    private func componentWithValueAndRangeValues(
        configuration: SliderConfigurationSnapshotTests,
        step: Double?
    ) -> some View {
        let value = "50%"
        let minText = "Min"
        let maxText = "Max"

        switch (configuration.contentType, step) {
        case (.text, let step?):
            SparkSlider(
                value: self.$value,
                in: 0...1,
                step: step,
                valueText: value,
                minValueText: minText,
                maxValueText: maxText
            )

        case (.text, nil):
            SparkSlider(
                value: self.$value,
                in: 0...1,
                valueText: value,
                minValueText: minText,
                maxValueText: maxText
            )

        case (.custom, let step?):
            SparkSlider(
                value: self.$value,
                in: 0...1,
                step: step,
                valueLabel: {
                    OtherContentView(text: value)
                },
                minValueLabel: {
                    OtherContentView(text: minText)
                },
                maxValueLabel: {
                    OtherContentView(text: maxText)
                }
            )

        case (.custom, nil):
            SparkSlider(
                value: self.$value,
                in: 0...1,
                valueLabel: {
                    OtherContentView(text: value)
                },
                minValueLabel: {
                    OtherContentView(text: minText)
                },
                maxValueLabel: {
                    OtherContentView(text: maxText)
                }
            )
        }
    }

    @ViewBuilder
    private func componentWithAllValues(
        configuration: SliderConfigurationSnapshotTests,
        step: Double?
    ) -> some View {
        let title = "Title"
        let value = "50%"
        let minText = "Min"
        let maxText = "Max"

        switch (configuration.contentType, step) {
        case (.text, let step?):
            SparkSlider(
                value: self.$value,
                in: 0...1,
                step: step,
                title: title,
                valueText: value,
                minValueText: minText,
                maxValueText: maxText
            )

        case (.text, nil):
            SparkSlider(
                value: self.$value,
                in: 0...1,
                title: title,
                valueText: value,
                minValueText: minText,
                maxValueText: maxText
            )

        case (.custom, let step?):
            SparkSlider(
                value: self.$value,
                in: 0...1,
                step: step,
                titleLabel: {
                    OtherContentView(text: title)
                },
                valueLabel: {
                    OtherContentView(text: value)
                },
                minValueLabel: {
                    OtherContentView(text: minText)
                },
                maxValueLabel: {
                    OtherContentView(text: maxText)
                }
            )

        case (.custom, nil):
            SparkSlider(
                value: self.$value,
                in: 0...1,
                titleLabel: {
                    OtherContentView(text: title)
                },
                valueLabel: {
                    OtherContentView(text: value)
                },
                minValueLabel: {
                    OtherContentView(text: minText)
                },
                maxValueLabel: {
                    OtherContentView(text: maxText)
                }
            )
        }
    }
}

// MARK: - Other View

private struct OtherContentView: View {
    let text: String
    var body: some View {
        HStack {
            Text(self.text)
            Text("(%)")
                .bold()
                .foregroundColor(.blue)
        }
    }
}
