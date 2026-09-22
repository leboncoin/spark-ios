//
//  CheckboxStyle.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 02/07/2025.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

struct CheckboxStyle: ToggleStyle {

    // MARK: - Properties

    private let dynamicColors: CheckboxDynamicColors
    private let staticColors: CheckboxStaticColors
    private let toggleOpacities: CheckboxToggleOpacities
    private let isIcon: Bool
    private let selectionState: CheckboxSelectionState?
    private let contentRadius: CGFloat
    private let dim: CGFloat
    private let titleStyle: CommonTitleStyle
    private let spacing: CGFloat
    private let showHiddenEmptyLabel: Bool

    private let selectedIcon: Image
    private let indeterminateIcon: Image?

    @State private var isPressed: Bool = false

    @Environment(\.isEnabled) private var isEnabled

    @LimitedScaledMetric private var size: CGFloat
    @LimitedScaledMetric private var lineWidth: CGFloat
    @LimitedScaledMetric private var iconPadding: CGFloat
    @LimitedScaledMetric private var hoverPadding: CGFloat
    @LimitedScaledMetric private var rectangleRadius: CGFloat

    @State private var animatedId = UUID()

    // MARK: - Initialization

    init(
        dynamicColors: CheckboxDynamicColors,
        staticColors: CheckboxStaticColors,
        toggleOpacities: CheckboxToggleOpacities,
        isIcon: Bool,
        selectionState: CheckboxSelectionState?,
        contentRadius: CGFloat,
        dim: CGFloat,
        titleStyle: CommonTitleStyle,
        spacing: CGFloat,
        showHiddenEmptyLabel: Bool,
        selectedIcon: Image,
        indeterminateIcon: Image?
    ) {
        self.dynamicColors = dynamicColors
        self.staticColors = staticColors
        self.toggleOpacities = toggleOpacities
        self.isIcon = isIcon
        self.selectionState = selectionState
        self.contentRadius = contentRadius
        self.dim = dim
        self.titleStyle = titleStyle
        self.spacing = spacing
        self.showHiddenEmptyLabel = showHiddenEmptyLabel
        self.selectedIcon = selectedIcon
        self.indeterminateIcon = indeterminateIcon

        self._size = .init(value: CheckboxConstants.size)
        self._lineWidth = .init(value: CheckboxConstants.lineWidth)
        self._iconPadding = .init(value: CheckboxConstants.iconPadding)
        self._hoverPadding = .init(value: CommonConstants.hoverPadding)
        self._rectangleRadius = .init(value: contentRadius)
    }

    // MARK: - Body

    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()

            if self.selectionState != .indeterminate {
                self.animatedId = .init()
            }
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

                    self.roundedRectangle(configuration: configuration)
                        .overlay {
                            self.icon()
                        }
                        .opacity(self.dim)
                        .frame(
                            width: self.size,
                            height: self.size
                        )
                        .transaction()
                        .overlay(
                            self.pressedView(configuration: configuration)
                        )
                }
                .optionalAnimation(
                    .easeInOut(duration: CommonConstants.animationDuration),
                    value: self.isPressed
                )
                .optionalAnimation(
                    .easeOut(duration: CommonConstants.animationDuration),
                    value: self.animatedId
                )

                // Title
                configuration.label
                    .applyLabelStyle(
                        titleStyle: self.titleStyle,
                        minHeight: self.size
                    )
            }
            .compositingGroup()
        }
        .buttonPressedStyle(self.$isPressed)
        .sparkSensoryFeedback(trigger: configuration.isOn)
        .accessibilityAction {
            configuration.isOn.toggle()
        }
    }

    // MARK: - Subview

    @ViewBuilder
    private func roundedRectangle(configuration: Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: self.rectangleRadius)
                .fill(self.dynamicColors.background)
                .opacity(self.toggleOpacities.background)

            RoundedRectangle(cornerRadius: self.rectangleRadius)
                .strokeBorder(
                    self.dynamicColors.border.color,
                    lineWidth: self.lineWidth
                )
                .opacity(self.toggleOpacities.border)
        }
        .id(self.animatedId)
    }

    @ViewBuilder
    private func icon() -> some View {
        let icon: Image? = switch self.selectionState {
        case .selected: self.selectedIcon
        case .indeterminate: self.indeterminateIcon
        default: nil
        }

        if let icon, self.isIcon {
            icon
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(self.staticColors.iconForeground)
                .padding(self.iconPadding)
        } else {
            EmptyView()
        }
    }

    @ViewBuilder
    private func pressedView(configuration: Configuration) -> some View {
        if self.isPressed {
            RoundedRectangle(cornerRadius: self.rectangleRadius)
                .inset(by: -self.hoverPadding / 2)
                .stroke(
                    self.staticColors.hover.color,
                    lineWidth: CommonConstants.hoverPadding
                )
        } else {
            EmptyView()
        }
    }
}

// MARK: - Extension

extension ToggleStyle where Self == CheckboxStyle {

    static func custom(
        viewModel: CheckboxViewModel,
        selectedIcon: Image,
        indeterminateIcon: Image?
    ) -> CheckboxStyle {
        .init(
            dynamicColors: viewModel.dynamicColors,
            staticColors: viewModel.staticColors,
            toggleOpacities: viewModel.toggleOpacities,
            isIcon: viewModel.isIcon,
            selectionState: viewModel.selectionState,
            contentRadius: viewModel.contentRadius,
            dim: viewModel.dim,
            titleStyle: viewModel.titleStyle,
            spacing: viewModel.spacing,
            showHiddenEmptyLabel: viewModel.showHiddenEmptyLabel,
            selectedIcon: selectedIcon,
            indeterminateIcon: indeterminateIcon
        )
    }
}
