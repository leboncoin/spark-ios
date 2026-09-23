//
//  Snackbar.swift
//  SparkComponentSnackbar
//
//  Created by robin.lemaire on 13/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkCommon
import SparkComponentButton

internal struct Snackbar<TitleLabel, DescriptionLabel, ActionButton>: View where TitleLabel: View, DescriptionLabel: View, ActionButton: View {

    // MARK: - Properties

    private let icon: Image?
    private var titleLabel: () -> TitleLabel
    private var descriptionLabel: () -> DescriptionLabel
    private var button: () -> ActionButton

    @Environment(\.theme) private var theme
    @Environment(\.snackbarAlignment) private var alignment
    @Environment(\.snackbarIntent) private var intent
    @Environment(\.snackbarDirection) private var direction

    @Environment(\.dynamicTypeSize) private var dynamicTypeSize

    @StateObject private var viewModel = SnackbarViewModel()

    // MARK: - Initialization

    init(
        _ icon: Image?,
        titleLabel: @escaping () -> TitleLabel,
        descriptionLabel: @escaping () -> DescriptionLabel,
        button: @escaping () -> ActionButton
    ) {
        self.icon = icon
        self.titleLabel = titleLabel
        self.descriptionLabel = descriptionLabel
        self.button = button
    }

    // MARK: - View

    var body: some View {
        self.contentStack {
            SparkHStack(spacing: self.viewModel.layout.horizontalSpacing) {
                // Icon
                self.icon?
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .sparkFrame(size: SnackbarConstants.iconSize)
                    .foregroundStyle(self.viewModel.colors.tintColorToken.color)
                    .accessibilityHidden(true)

                // Content
                SparkVStack(
                    alignment: .leading,
                    spacing: self.viewModel.layout.verticalSubSpacing
                ) {
                    // Title
                    self.titleLabel()
                        .font(self.viewModel.typographies.titleFontToken)
                        .fixedSize(horizontal: false, vertical: true)

                    // Description
                    self.descriptionLabel()
                        .font(self.viewModel.typographies.descriptionFontToken)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .foregroundStyle(self.viewModel.colors.tintColorToken)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            if !self.button().isEmptyView {
                HStack {
                    // Space (only on vertical snackbar)
                    if self.alignment == .vertical || self.dynamicTypeSize.isAccessibilitySize {
                        Spacer()
                    }

                    // Button
                    self.button()
                        .sparkButtonIntent(self.viewModel.intents.button)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .sparkPadding(.init(
            top: self.viewModel.layout.verticalPadding,
            leading: self.viewModel.layout.leadingPadding,
            bottom: self.viewModel.layout.verticalPadding,
            trailing: self.viewModel.layout.trailingPadding
        ))
        .background(self.viewModel.colors.backgroundColorToken)
        .transaction { transaction in
            transaction.disablesAnimations = true // Removes animation issues
        }
        .fixedSize(horizontal: false, vertical: true)
        .sparkBorder(
            width: self.viewModel.border.width,
            radius: self.viewModel.border.radius,
            colorToken: self.viewModel.colors.borderColorToken
        )
        .shadow(self.theme.value.elevation.dropShadow)
        .sparkPadding(self.viewModel.layout.presentationPadding)
        .transition(.move(edge: self.direction.edge).combined(with: .opacity))
        .accessibilityElement(children: .contain)
        .accessibilityIdentifier(SnackbarAccessibilityIdentifier.view)
        .onAppear {
            self.viewModel.setup(
                theme: self.theme.value,
                intent: self.intent
            )
        }
        .onChange(of: self.theme) { theme in
            self.viewModel.theme = theme.value
        }
        .onChange(of: self.intent) { intent in
            self.viewModel.intent = intent
        }
    }

    // MARK: - Private Modifier

    @ViewBuilder
    private func contentStack<Content>(
        @ViewBuilder content: @escaping () -> Content
    ) -> some View where Content: View {
        switch self.alignment {
        case .horizontal:
            SparkAdaptiveStack(
                axis: .horizontal,
                spacing: self.viewModel.layout.horizontalSpacing,
                accessibilityAlignment: .leading,
                accessibilitySpacing: self.viewModel.layout.verticalSpacing,
                content: content
            )
        case .vertical:
            SparkVStack(
                alignment: .leading,
                spacing: self.viewModel.layout.verticalSpacing,
                content: content
            )
        }
    }
}
