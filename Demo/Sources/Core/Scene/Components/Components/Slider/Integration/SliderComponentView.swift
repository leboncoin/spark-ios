//
//  SliderComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 27/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias SliderComponentView = ComponentViewable<SliderConfiguration, SliderImplementationView, SliderConfigurationView, SliderExtraTools>

extension SliderComponentView {

    init() {
        self.init(style: .verticalList, styles: [.alone, .verticalList])
    }
}

// MARK: - Subview

struct SliderImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<SliderConfiguration>
    @State private var value: Float = 0
    @State private var isEditing: Bool = false

    // MARK: - View

    var body: some View {
        VStack {
            self.component()
                .sparkTheme(self.configurationWrapped.theme.value)
                .sparkSliderIntent(self.configurationWrapped.intent)
                .sparkSliderIsFloatingValueLabel(self.configurationWrapped.isFloatingValueLabel)
                .demoAccessibilityRangeValuesLabel(self.configurationWrapped)
                .demoDisabled(self.configurationWrapped)
                .demoAccessibilityLabel(self.configurationWrapped)
                .demoAccessibilityValue(self.configurationWrapped)
                .onAppear() {
                    self.value = Float(self.configurationWrapped.valueString) ?? 0
                }
                .onChange(of: self.configurationWrapped.valueString) { newValue in
                    self.value = Float(newValue) ?? 0
                }

            HStack {
                Text(configurationWrapped.getInfoValue(from: self.value))
                Divider()
                    .infoFrame()
                Text("Is Editing: \(self.isEditing)")
            }
            .demoComponentInfoBackground()
        }
    }

    // MARK: - Component

    @ViewBuilder
    private func component() -> some View {
        switch (
            self.configurationWrapped.isStep,
            self.configurationWrapped.isValueLabel,
            self.configurationWrapped.isRangeValuesLabel
        ) {
        case (true, true, true): self.componentWithStepAndAllContents()
        case (true, true, false): self.componentWithStepAndValueContent()
        case (true, false, true): self.componentWithStepAndRangeValuesContent()
        case (true, false, false): self.componentWithStep()

        case (false, true, true): self.componentWithoutStepAndAllContents()
        case (false, true, false): self.componentWithoutStepAndValueContent()
        case (false, false, true): self.componentWithoutStepAndRangeValuesContent()
        case (false, false, false): self.componentWithoutStep()
        }
    }

    // MARK: - Component With Step

    @ViewBuilder
    private func componentWithStepAndAllContents() -> some View {
        if self.configurationWrapped.swiftUIIsCustomValue {
            let customValue = self.configurationWrapped.swiftUISecondText

            if let title = self.configurationWrapped.titleString.nilIfEmpty {
                SparkSlider(
                    value: self.$value,
                    in: self.configurationWrapped.bounds(),
                    step: self.configurationWrapped.step(),
                    titleLabel: {
                        self.label(value: title, customValue: customValue)
                    }, valueLabel: {
                        self.label(value: self.getValueText(), customValue: customValue)
                    }, minValueLabel: {
                        self.label(value: self.configurationWrapped.lowerBoundString, customValue: customValue)
                    }, maxValueLabel: {
                        self.label(value: self.configurationWrapped.upperBoundString, customValue: customValue)
                    }, onEditingChanged: { isEditing in
                        self.isEditing = isEditing
                    }
                )
            } else {
                SparkSlider(
                    value: self.$value,
                    in: self.configurationWrapped.bounds(),
                    step: self.configurationWrapped.step(),
                    valueLabel: {
                        self.label(value: self.getValueText(), customValue: customValue)
                    }, minValueLabel: {
                        self.label(value: self.configurationWrapped.lowerBoundString, customValue: customValue)
                    }, maxValueLabel: {
                        self.label(value: self.configurationWrapped.upperBoundString, customValue: customValue)
                    }, onEditingChanged: { isEditing in
                        self.isEditing = isEditing
                    }
                )
            }
        } else {
            if let title = self.configurationWrapped.titleString.nilIfEmpty {
                SparkSlider(
                    value: self.$value,
                    in: self.configurationWrapped.bounds(),
                    step: self.configurationWrapped.step(),
                    title: title,
                    valueText: self.getValueText(),
                    minValueText: "\(self.configurationWrapped.lowerBoundString)",
                    maxValueText: "\(self.configurationWrapped.upperBoundString)",
                    onEditingChanged: { isEditing in
                        self.isEditing = isEditing
                    }
                )
            } else {
                SparkSlider(
                    value: self.$value,
                    in: self.configurationWrapped.bounds(),
                    step: self.configurationWrapped.step(),
                    valueText: self.getValueText(),
                    minValueText: "\(self.configurationWrapped.lowerBoundString)",
                    maxValueText: "\(self.configurationWrapped.upperBoundString)",
                    onEditingChanged: { isEditing in
                        self.isEditing = isEditing
                    }
                )
            }
        }
    }

    @ViewBuilder
    private func componentWithStepAndValueContent() -> some View {
        if self.configurationWrapped.swiftUIIsCustomValue {
            let customValue = self.configurationWrapped.swiftUISecondText

            if let title = self.configurationWrapped.titleString.nilIfEmpty {
                SparkSlider(
                    value: self.$value,
                    in: self.configurationWrapped.bounds(),
                    step: self.configurationWrapped.step(),
                    titleLabel: {
                        self.label(value: title, customValue: customValue)
                    }, valueLabel: {
                        self.label(value: self.getValueText(), customValue: customValue)
                    }, onEditingChanged: { isEditing in
                        self.isEditing = isEditing
                    }
                )
            } else {
                SparkSlider(
                    value: self.$value,
                    in: self.configurationWrapped.bounds(),
                    step: self.configurationWrapped.step(),
                    valueLabel: {
                        self.label(value: self.getValueText(), customValue: customValue)
                    }, onEditingChanged: { isEditing in
                        self.isEditing = isEditing
                    }
                )
            }
        } else {
            if let title = self.configurationWrapped.titleString.nilIfEmpty {
                SparkSlider(
                    value: self.$value,
                    in: self.configurationWrapped.bounds(),
                    step: self.configurationWrapped.step(),
                    title: title,
                    valueText: self.getValueText(),
                    onEditingChanged: { isEditing in
                        self.isEditing = isEditing
                    }
                )
            } else {
                SparkSlider(
                    value: self.$value,
                    in: self.configurationWrapped.bounds(),
                    step: self.configurationWrapped.step(),
                    valueText: self.getValueText(),
                    onEditingChanged: { isEditing in
                        self.isEditing = isEditing
                    }
                )
            }
        }
    }

    @ViewBuilder
    private func componentWithStepAndRangeValuesContent() -> some View {
        if self.configurationWrapped.swiftUIIsCustomValue {
            let customValue = self.configurationWrapped.swiftUISecondText

            if let title = self.configurationWrapped.titleString.nilIfEmpty {
                SparkSlider(
                    value: self.$value,
                    in: self.configurationWrapped.bounds(),
                    step: self.configurationWrapped.step(),
                    titleLabel: {
                        self.label(value: title, customValue: customValue)
                    }, minValueLabel: {
                        self.label(value: self.configurationWrapped.lowerBoundString, customValue: customValue)
                    }, maxValueLabel: {
                        self.label(value: self.configurationWrapped.upperBoundString, customValue: customValue)
                    }, onEditingChanged: { isEditing in
                        self.isEditing = isEditing
                    }
                )
            } else {
                SparkSlider(
                    value: self.$value,
                    in: self.configurationWrapped.bounds(),
                    step: self.configurationWrapped.step(),
                    minValueLabel: {
                        self.label(value: self.configurationWrapped.lowerBoundString, customValue: customValue)
                    }, maxValueLabel: {
                        self.label(value: self.configurationWrapped.upperBoundString, customValue: customValue)
                    }, onEditingChanged: { isEditing in
                        self.isEditing = isEditing
                    }
                )
            }
        } else {
            if let title = self.configurationWrapped.titleString.nilIfEmpty {
                SparkSlider(
                    value: self.$value,
                    in: self.configurationWrapped.bounds(),
                    step: self.configurationWrapped.step(),
                    title: title,
                    minValueText: "\(self.configurationWrapped.lowerBoundString)",
                    maxValueText: "\(self.configurationWrapped.upperBoundString)",
                    onEditingChanged: { isEditing in
                        self.isEditing = isEditing
                    }
                )
            } else {
                SparkSlider(
                    value: self.$value,
                    in: self.configurationWrapped.bounds(),
                    step: self.configurationWrapped.step(),
                    minValueText: "\(self.configurationWrapped.lowerBoundString)",
                    maxValueText: "\(self.configurationWrapped.upperBoundString)",
                    onEditingChanged: { isEditing in
                        self.isEditing = isEditing
                    }
                )
            }
        }
    }

    @ViewBuilder
    private func componentWithStep() -> some View {
        if let title = self.configurationWrapped.titleString.nilIfEmpty {
            SparkSlider(
                value: self.$value,
                in: self.configurationWrapped.bounds(),
                step: self.configurationWrapped.step(),
                title: title,
                onEditingChanged: { isEditing in
                    self.isEditing = isEditing
                }
            )
        } else {
            SparkSlider(
                value: self.$value,
                in: self.configurationWrapped.bounds(),
                step: self.configurationWrapped.step(),
                onEditingChanged: { isEditing in
                    self.isEditing = isEditing
                }
            )
        }
    }

    // MARK: - Component Without Step

    @ViewBuilder
    private func componentWithoutStepAndAllContents() -> some View {
        if self.configurationWrapped.swiftUIIsCustomValue {
            let customValue = self.configurationWrapped.swiftUISecondText

            if let title = self.configurationWrapped.titleString.nilIfEmpty {
                SparkSlider(
                    value: self.$value,
                    in: self.configurationWrapped.bounds(),
                    titleLabel: {
                        self.label(value: title, customValue: customValue)
                    }, valueLabel: {
                        self.label(value: self.getValueText(), customValue: customValue)
                    }, minValueLabel: {
                        self.label(value: self.configurationWrapped.lowerBoundString, customValue: customValue)
                    }, maxValueLabel: {
                        self.label(value: self.configurationWrapped.upperBoundString, customValue: customValue)
                    }, onEditingChanged: { isEditing in
                        self.isEditing = isEditing
                    }
                )
            } else {
                SparkSlider(
                    value: self.$value,
                    in: self.configurationWrapped.bounds(),
                    valueLabel: {
                        self.label(value: self.getValueText(), customValue: customValue)
                    }, minValueLabel: {
                        self.label(value: self.configurationWrapped.lowerBoundString, customValue: customValue)
                    }, maxValueLabel: {
                        self.label(value: self.configurationWrapped.upperBoundString, customValue: customValue)
                    }, onEditingChanged: { isEditing in
                        self.isEditing = isEditing
                    }
                )
            }
        } else {
            if let title = self.configurationWrapped.titleString.nilIfEmpty {
                SparkSlider(
                    value: self.$value,
                    in: self.configurationWrapped.bounds(),
                    title: title,
                    valueText: self.getValueText(),
                    minValueText: "\(self.configurationWrapped.lowerBoundString)",
                    maxValueText: "\(self.configurationWrapped.upperBoundString)",
                    onEditingChanged: { isEditing in
                        self.isEditing = isEditing
                    }
                )
            } else {
                SparkSlider(
                    value: self.$value,
                    in: self.configurationWrapped.bounds(),
                    valueText: self.getValueText(),
                    minValueText: "\(self.configurationWrapped.lowerBoundString)",
                    maxValueText: "\(self.configurationWrapped.upperBoundString)",
                    onEditingChanged: { isEditing in
                        self.isEditing = isEditing
                    }
                )
            }
        }
    }

    @ViewBuilder
    private func componentWithoutStepAndValueContent() -> some View {
        if self.configurationWrapped.swiftUIIsCustomValue {
            let customValue = self.configurationWrapped.swiftUISecondText

            if let title = self.configurationWrapped.titleString.nilIfEmpty {
                SparkSlider(
                    value: self.$value,
                    in: self.configurationWrapped.bounds(),
                    titleLabel: {
                        self.label(value: title, customValue: customValue)
                    },
                    valueLabel: {
                        self.label(value: self.getValueText(), customValue: customValue)
                    }, onEditingChanged: { isEditing in
                        self.isEditing = isEditing
                    }
                )
            } else {
                SparkSlider(
                    value: self.$value,
                    in: self.configurationWrapped.bounds(),
                    valueLabel: {
                        self.label(value: self.getValueText(), customValue: customValue)
                    }, onEditingChanged: { isEditing in
                        self.isEditing = isEditing
                    }
                )
            }
        } else {
            if let title = self.configurationWrapped.titleString.nilIfEmpty {
                SparkSlider(
                    value: self.$value,
                    in: self.configurationWrapped.bounds(),
                    title: title,
                    valueText: self.getValueText(),
                    onEditingChanged: { isEditing in
                        self.isEditing = isEditing
                    }
                )
            } else {
                SparkSlider(
                    value: self.$value,
                    in: self.configurationWrapped.bounds(),
                    valueText: self.getValueText(),
                    onEditingChanged: { isEditing in
                        self.isEditing = isEditing
                    }
                )
            }
        }
    }

    @ViewBuilder
    private func componentWithoutStepAndRangeValuesContent() -> some View {
        if self.configurationWrapped.swiftUIIsCustomValue {
            let customValue = self.configurationWrapped.swiftUISecondText

            if let title = self.configurationWrapped.titleString.nilIfEmpty {
                SparkSlider(
                    value: self.$value,
                    in: self.configurationWrapped.bounds(),
                    titleLabel: {
                        self.label(value: title, customValue: customValue)
                    }, minValueLabel: {
                        self.label(value: self.configurationWrapped.lowerBoundString, customValue: customValue)
                    }, maxValueLabel: {
                        self.label(value: self.configurationWrapped.upperBoundString, customValue: customValue)
                    }, onEditingChanged: { isEditing in
                        self.isEditing = isEditing
                    }
                )
            } else {
                SparkSlider(
                    value: self.$value,
                    in: self.configurationWrapped.bounds(),
                    minValueLabel: {
                        self.label(value: self.configurationWrapped.lowerBoundString, customValue: customValue)
                    }, maxValueLabel: {
                        self.label(value: self.configurationWrapped.upperBoundString, customValue: customValue)
                    }, onEditingChanged: { isEditing in
                        self.isEditing = isEditing
                    }
                )
            }
        } else {
            if let title = self.configurationWrapped.titleString.nilIfEmpty {
                SparkSlider(
                    value: self.$value,
                    in: self.configurationWrapped.bounds(),
                    title: title,
                    minValueText: "\(self.configurationWrapped.lowerBoundString)",
                    maxValueText: "\(self.configurationWrapped.upperBoundString)",
                    onEditingChanged: { isEditing in
                        self.isEditing = isEditing
                    }
                )
            } else {
                SparkSlider(
                    value: self.$value,
                    in: self.configurationWrapped.bounds(),
                    minValueText: "\(self.configurationWrapped.lowerBoundString)",
                    maxValueText: "\(self.configurationWrapped.upperBoundString)",
                    onEditingChanged: { isEditing in
                        self.isEditing = isEditing
                    }
                )
            }
        }
    }

    @ViewBuilder
    private func componentWithoutStep() -> some View {
        if let title = self.configurationWrapped.titleString.nilIfEmpty {
            SparkSlider(
                value: self.$value,
                in: self.configurationWrapped.bounds(),
                title: title,
                onEditingChanged: { isEditing in
                    self.isEditing = isEditing
                }
            )
        } else {
            SparkSlider(
                value: self.$value,
                in: self.configurationWrapped.bounds(),
                onEditingChanged: { isEditing in
                    self.isEditing = isEditing
                }
            )
        }
    }

    // MARK: - Label

    private func label(value: String, customValue: String) -> some View {
        Group {
            Text("\(value) ") +
            Text(customValue)
                .foregroundColor(.blue)
                .italic()
        }
    }

    // MARK: - Value

    private func getValueText() -> String {
        return if let value = self.configurationWrapped.customValueLabel.nilIfEmpty {
            value
        } else {
            self.configurationWrapped.getFormattedValue(from: self.value)
        }
    }
}

// MARK: - Extension

private extension View {

    @ViewBuilder
    func demoAccessibilityRangeValuesLabel(_ configuration: SliderConfiguration) -> some View {
        if configuration.isRangeValuesLabel && configuration.swiftUIIsCustomValue {
            let minValue = configuration.getFormattedValue(from: configuration.minimumValue) + configuration.swiftUISecondText
            let maxValue = configuration.getFormattedValue(from: configuration.maximumValue) + configuration.swiftUISecondText
            self.sparkSliderAccessibilityRangeValuesLabel(minValue, max: maxValue)
        } else {
            self
        }
    }
}
