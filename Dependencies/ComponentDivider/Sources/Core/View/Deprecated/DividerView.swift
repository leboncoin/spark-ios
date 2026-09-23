//
//  DividerView.swift
//  SparkComponentDivider
//
//  Created by louis.borlee on 17/07/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import SwiftUI
import Combine
import SparkTheming
@_spi(SI_SPI) import SparkCommon

/// The SwiftUI version of the divider.
@available(*, deprecated, message: "Replaced by SparkDivider")
public struct DividerView: View {

    @ObservedObject private var viewModel: DividerViewModelDeprecated

    private let axis: DividerAxis
    private let alignment: DividerAlignment

    private let text: (() -> Text)?

    @ScaledMetric var scaleFactor = 1.0
    private var scaledHeight: CGFloat {
        return DividerConstants.thickness * self.scaleFactor
    }

    /// Initialize a new divider view without text.
    /// - Parameters:
    ///   - theme: The spark theme of the divider.
    ///   - intent: The intent of the divider.
    ///   - axis: The axis of the divider. The default is ``.horizontal``.
    ///   - alignment: The alignment of the divider. The default is ``.center``.
    public init(
        theme: any Theme,
        intent: DividerIntent,
        axis: DividerAxis = .horizontal,
        alignment: DividerAlignment = .center
    ) {
        let viewModel = DividerViewModelDeprecated(theme: theme, intent: intent)
        self.viewModel = viewModel
        self.axis = axis
        self.alignment = alignment
        self.text = nil
    }

    /// Initialize a new divider view with a text.
    /// - Parameters:
    ///   - theme: The spark theme of the divider.
    ///   - intent: The intent of the divider.
    ///   - axis: The axis of the divider. The default is ``.horizontal``.
    ///   - alignment: The alignment of the divider. The default is ``.center``.
    ///   - text: Text to show inbetween separators. Its `.foregroudColor` and `.font` will be overriden by Spark.
    public init(
        theme: any Theme,
        intent: DividerIntent,
        axis: DividerAxis = .horizontal,
        alignment: DividerAlignment = .center,
        text: @escaping () -> Text
    ) {
        let viewModel = DividerViewModelDeprecated(theme: theme, intent: intent)
        self.viewModel = viewModel
        self.axis = axis
        self.alignment = alignment
        self.text = text
    }

    public var body: some View {
        if axis == .horizontal {
            horizontalDivider()
        } else {
            verticalDivider()
        }
    }

    @ViewBuilder
    private func styledText(_ text: Text) -> some View {
        text
            .foregroundColor(viewModel.textColor.color)
            .font(viewModel.textFont.font)
            .layoutPriority(2)
            .accessibilityIdentifier(DividerAccessibilityIdentifier.view)
    }

    // MARK: - Horizontal
    @ViewBuilder
    private func horizontalDivider() -> some View {
        let firstSeparator = horizontalSeparator()
        if let text = text?() {
            HStack(spacing: viewModel.spacing) {
                firstSeparator
                    .frame(maxWidth: alignment == .leading ? DividerConstants.minimumWidth : .infinity)

                styledText(text)

                horizontalSeparator()
                    .frame(maxWidth: alignment == .trailing ? DividerConstants.minimumWidth : .infinity)
            }
            .accessibilityElement(children: .combine)
            .accessibilityIdentifier(DividerAccessibilityIdentifier.view)
        } else {
            firstSeparator
        }
    }

    @ViewBuilder
    private func horizontalSeparator() -> some View {
        viewModel.separatorColor.color
            .frame(height: scaledHeight)
            .frame(minWidth: DividerConstants.minimumWidth)
    }

    // MARK: - Vertical
    @ViewBuilder
    private func verticalDivider() -> some View {
        let firstSeparator = verticalSeparator()
        if let text = text?() {
            VStack(spacing: viewModel.spacing) {
                firstSeparator
                    .frame(maxHeight: alignment == .top ? DividerConstants.minimumWidth : .infinity)

                styledText(text)

                verticalSeparator()
                    .frame(maxHeight: alignment == .bottom ? DividerConstants.minimumWidth : .infinity)
            }
            .accessibilityElement(children: .combine)
            .accessibilityIdentifier(DividerAccessibilityIdentifier.view)
        } else {
            firstSeparator
        }
    }

    @ViewBuilder
    private func verticalSeparator() -> some View {
        viewModel.separatorColor.color
            .frame(width: scaledHeight)
            .frame(minHeight: DividerConstants.minimumWidth)
    }
}
