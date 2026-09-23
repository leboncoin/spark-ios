//
//  SparkTabItemRenderer.swift
//  SparkComponentTab
//
//  Created by robin.lemaire on 24/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

struct SparkTabItemRenderer<Label, ExtraLabel>: View where Label: View, ExtraLabel: View {

    // MARK: - Properties

    private let icon: Image?
    private let label: () -> Label
    private let extraLabel: () -> ExtraLabel

    @Environment(\.theme) private var theme
    @Environment(\.tabIntent) private var intent
    @Environment(\.tabLayout) private var layout
    @Environment(\.tabSize) private var size
    @Environment(\.tabSizes) private var sizes
    @Environment(\.tabItemIsSelected) private var isSelected
    @Environment(\.tabItemIsPressed) private var isPressed

    @StateObject private var viewModel = TabSegmentViewModel()

    // MARK: - Initialization

    init(
        icon: Image? = nil,
        @ViewBuilder label: @escaping () -> Label,
        @ViewBuilder extraLabel: @escaping () -> ExtraLabel
    ) {
        self.icon = icon
        self.label = label
        self.extraLabel = extraLabel
    }

    // MARK: - View

    var body: some View {
        HStack(alignment: .center, spacing: self.layout.spacing) {
            self.icon?
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(self.viewModel.contentColors.tintColorToken)
                .frame(size: self.sizes.iconHeight)

            self.label()
                .foregroundStyle(self.viewModel.contentColors.tintColorToken)
                .font(self.viewModel.fonts.typographyFontToken)
                .lineLimit(1)

            self.extraLabel()
        }
        .scaleEffect(self.viewModel.isPressed ? TabConstants.pressedScaled : 1.0)
        .optionalAnimation(
            .easeInOut(duration: TabConstants.contentAnimationDuration),
            value: self.viewModel.isPressed
        )
        .frame(maxWidth: .infinity)
        .padding(.horizontal, self.layout.horizontalPadding)
        .padding(.vertical, self.layout.verticalPadding)
        .frame(height: self.sizes.height)
        .background(self.viewModel.contentColors.backgroundColorToken)
        .optionalAnimation(
            .easeInOut(duration: TabConstants.animationDuration),
            value: self.viewModel.contentColors.backgroundColorToken.color
        )
        .contentShape(Rectangle())
        .onAppear() {
            self.viewModel.setup(
                theme: self.theme.value,
                intent: self.intent,
                size: self.size,
                isSelected: self.isSelected
            )
        }
        .onChange(of: self.theme) { theme in
            self.viewModel.theme = theme.value
        }
        .onChange(of: self.intent) { intent in
            self.viewModel.intent = intent
        }
        .onChange(of: self.size) { size in
            self.viewModel.size = size
        }
        .onChange(of: self.isSelected) { isSelected in
            self.viewModel.isSelected = isSelected
        }
        .onChange(of: self.isPressed) { isPressed in
            self.viewModel.isPressed = isPressed
        }
    }
}
