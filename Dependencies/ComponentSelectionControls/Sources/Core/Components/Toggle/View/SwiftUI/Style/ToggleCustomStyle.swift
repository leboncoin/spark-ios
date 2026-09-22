//
//  ToggleCustomStyle.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 02/07/2025.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkResources
@_spi(SI_SPI) import SparkCommon

struct ToggleCustomStyle: ToggleStyle {

    // MARK: - Properties

    private let dynamicColors: ToggleDynamicColors
    private let staticColors: ToggleStaticColors
    private let isIcon: Bool
    private let contentRadius: CGFloat
    private let dim: CGFloat
    private let titleStyle: CommonTitleStyle
    private let spacing: CGFloat
    private let showHiddenEmptyLabel: Bool

    private let onIcon: Image = Image(spark: \.check)
    private let offIcon: Image = Image(spark: \.cross)

    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    @State private var isPressed: Bool = false

    // MARK: - Initialization

    init(
        dynamicColors: ToggleDynamicColors,
        staticColors: ToggleStaticColors,
        isIcon: Bool,
        contentRadius: CGFloat,
        dim: CGFloat,
        titleStyle: CommonTitleStyle,
        spacing: CGFloat,
        showHiddenEmptyLabel: Bool
    ) {
        self.dynamicColors = dynamicColors
        self.staticColors = staticColors
        self.isIcon = isIcon
        self.contentRadius = contentRadius
        self.dim = dim
        self.titleStyle = titleStyle
        self.spacing = spacing
        self.showHiddenEmptyLabel = showHiddenEmptyLabel
    }

    // MARK: - Body

    func makeBody(configuration: Configuration) -> some View {
        SparkHStack(spacing: self.spacing) {
            ZStack {

                // Hidden label used to align the toggle and the label
                configuration.label
                    .applyHiddenLabelStyle(
                        showHiddenEmptyLabel: self.showHiddenEmptyLabel,
                        titleStyle: self.titleStyle,
                        width: ToggleConstants.width
                    )

                // Toggle
                Button {
                    configuration.isOn.toggle()
                } label: {
                    RoundedRectangle(cornerRadius: self.contentRadius)
                        .fill(self.dynamicColors.background)
                        .overlay {
                            ZStack {
                                HStack(alignment: .center, spacing: 0) {
                                    if configuration.isOn {
                                        Spacer()
                                    }

                                    RoundedRectangle(cornerRadius: self.contentRadius)
                                        .fill(self.staticColors.dotBackground)
                                        .padding(ToggleConstants.padding)
                                        .frame(
                                            width: self.canChangeDotSize() ? ToggleConstants.dotPressedSize : ToggleConstants.dotSize
                                        )
                                        .overlay {
                                            if self.isIcon {
                                                self.icon(configuration: configuration)
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .foregroundStyle(self.dynamicColors.dotForeground)
                                                    .frame(size: ToggleConstants.dotIconSize)
                                            }
                                        }

                                    if !configuration.isOn {
                                        Spacer()
                                    }
                                }
                            }
                        }
                        .opacity(self.dim)
                        .frame(
                            width: ToggleConstants.width,
                            height: ToggleConstants.height
                        )
                        .transaction()
                        .overlay(
                            self.pressedView()
                        )
                }
                .buttonPressedStyle(self.$isPressed)
                .sparkSensoryFeedback(trigger: configuration.isOn)
                .optionalAnimation(
                    .easeInOut(duration: CommonConstants.animationDuration),
                    value: self.isPressed
                )
                .optionalAnimation(
                    .easeOut(duration: CommonConstants.animationDuration),
                    value: configuration.isOn
                )
                .accessibilityAction {
                    configuration.isOn.toggle()
                }
            }

            // Title
            configuration.label
                .applyLabelStyle(
                    titleStyle: self.titleStyle,
                    minHeight: ToggleConstants.height
                )
        }
    }

    // MARK: - Subview

    private func icon(configuration: Configuration) -> Image {
        if configuration.isOn {
            self.onIcon
        } else {
            self.offIcon
        }
    }

    @ViewBuilder
    private func pressedView() -> some View {
        if self.isPressed {
            RoundedRectangle(cornerRadius: self.contentRadius)
                .inset(by: -CommonConstants.hoverPadding / 2)
                .stroke(
                    self.staticColors.hover.color,
                    lineWidth: CommonConstants.hoverPadding
                )
        } else {
            EmptyView()
        }
    }

    // MARK: - Getter

    private func canChangeDotSize() -> Bool {
        self.isPressed && !self.reduceMotion
    }
}

// MARK: - Extension

extension ToggleStyle where Self == ToggleCustomStyle {

    static func custom(viewModel: ToggleViewModel) -> ToggleCustomStyle {
        .init(
            dynamicColors: viewModel.dynamicColors,
            staticColors: viewModel.staticColors,
            isIcon: viewModel.isIcon,
            contentRadius: viewModel.contentRadius,
            dim: viewModel.dim,
            titleStyle: viewModel.titleStyle,
            spacing: viewModel.spacing,
            showHiddenEmptyLabel: viewModel.showHiddenEmptyLabel
        )
    }
}

// MARK: - Private Extension

private extension View {

    func frame(size: CGFloat) -> some View {
        self.frame(width: size, height: size)
    }
}
