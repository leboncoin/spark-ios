//
//  RadioButtonStyle.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 02/07/2025.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

struct RadioButtonStyle: ToggleStyle {

    // MARK: - Properties

    private let dynamicColors: RadioButtonDynamicColors
    private let staticColors: RadioButtonStaticColors
    private let dim: CGFloat
    private let titleStyle: CommonTitleStyle
    private let spacing: CGFloat
    private let showHiddenEmptyLabel: Bool

    @State private var isPressed: Bool = false

    @LimitedScaledMetric private var size: CGFloat
    @LimitedScaledMetric private var dotSize: CGFloat
    @LimitedScaledMetric private var lineWidth: CGFloat
    @LimitedScaledMetric private var hoverPadding: CGFloat

    @Environment(\.radioButtonIsAnimated) private var isAnimated

    // MARK: - Initialization

    init(
        dynamicColors: RadioButtonDynamicColors,
        staticColors: RadioButtonStaticColors,
        dim: CGFloat,
        titleStyle: CommonTitleStyle,
        spacing: CGFloat,
        showHiddenEmptyLabel: Bool
    ) {
        self.dynamicColors = dynamicColors
        self.staticColors = staticColors
        self.dim = dim
        self.titleStyle = titleStyle
        self.spacing = spacing
        self.showHiddenEmptyLabel = showHiddenEmptyLabel

        self._size = .init(value: RadioButtonConstants.size)
        self._dotSize = .init(value: RadioButtonConstants.dotSize)
        self._lineWidth = .init(value: RadioButtonConstants.lineWidth)
        self._hoverPadding = .init(value: CommonConstants.hoverPadding)
    }

    // MARK: - Body

    func makeBody(configuration: Configuration) -> some View {
        Button {
            self.action(configuration: configuration)
        } label: {
            SparkHStack(spacing: self.spacing) {
                ZStack {

                    // Hidden label used to align the toggle and the label
                    configuration.label
                        .applyHiddenLabelStyle(
                            showHiddenEmptyLabel: self.showHiddenEmptyLabel,
                            titleStyle: self.titleStyle,
                            width: self.size
                        )

                    // Circle
                    ZStack() {
                        Circle()
                            .strokeBorder(
                                self.dynamicColors.circle.color,
                                lineWidth: self.lineWidth
                            )

                        self.dotView(configuration: configuration)
                    }
                    .opacity(self.dim)
                    .frame(
                        width: self.size,
                        height: self.size
                    )
                    .transaction(isAnimated: self.isAnimated)
                    .overlay(
                        self.pressedView(configuration: configuration)
                    )
                }
                .compositingGroup()
                .optionalAnimation(
                    .easeInOut(duration: CommonConstants.animationDuration),
                    value: self.isPressed
                )
                .optionalAnimation(
                    .easeOut(duration: CommonConstants.animationDuration),
                    value: configuration.isOn == true
                )

                // Title
                configuration.label
                    .applyLabelStyle(
                        titleStyle: self.titleStyle,
                        minHeight: self.size
                    )
            }
        }
        .buttonPressedStyle(self.$isPressed)
        .sparkSensoryFeedback(trigger: configuration.isOn)
        .accessibilityAction {
            self.action(configuration: configuration)
        }
        .disabled(configuration.isOn)
    }

    // MARK: - Subview

    @ViewBuilder
    private func dotView(configuration: Configuration) -> some View {
        let size = configuration.isOn ? self.dotSize : 0
        Circle()
            .fill(self.staticColors.dot)
            .frame(
                width: size,
                height: size
            )
    }

    @ViewBuilder
    private func pressedView(configuration: Configuration) -> some View {
        if !configuration.isOn, self.isPressed {
            Circle()
                .inset(by: -self.hoverPadding / 2)
                .stroke(
                    self.staticColors.hover.color,
                    lineWidth: self.hoverPadding
                )
        } else {
            EmptyView()
        }
    }

    // MARK: - Actions

    private func action(configuration: Configuration) {
        if !configuration.isOn {
            configuration.isOn.toggle()
        }
    }
}

// MARK: - Extension

extension ToggleStyle where Self == RadioButtonStyle {

    static func custom(viewModel: RadioButtonViewModel) -> RadioButtonStyle {
        .init(
            dynamicColors: viewModel.dynamicColors,
            staticColors: viewModel.staticColors,
            dim: viewModel.dim,
            titleStyle: viewModel.titleStyle,
            spacing: viewModel.spacing,
            showHiddenEmptyLabel: viewModel.showHiddenEmptyLabel
        )
    }
}
