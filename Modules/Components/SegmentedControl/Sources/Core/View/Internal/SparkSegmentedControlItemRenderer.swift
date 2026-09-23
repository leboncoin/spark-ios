//
//  SparkSegmentedControlItemRenderer.swift
//  SparkComponentSegmentedControl
//
//  Created by robin.lemaire on 24/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

struct SparkSegmentedControlItemRenderer<Label>: View where Label: View {

    // MARK: - Properties

    private let icon: Image?
    private let label: () -> Label

    @Environment(\.theme) private var theme
    @Environment(\.segmentedControlItemIsSelected) private var isSelected
    @Environment(\.segmentedControlItemIsPressed) private var isPressed
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize

    @StateObject private var viewModel = SegmentedControlItemViewModel()

    // MARK: - Initialization

    init(
        icon: Image? = nil,
        @ViewBuilder label: @escaping () -> Label
    ) {
        self.icon = icon
        self.label = label
    }

    // MARK: - View

    var body: some View {
        HStack(spacing: self.viewModel.layout.spacing) {
            self.icon?
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(self.viewModel.colors.contentColorToken)
                .frame(size: SegmentedControlConstants.iconSize)

            self.label()
                .foregroundStyle(self.viewModel.colors.contentColorToken)
                .foregroundStyle(.orange)
                .font(self.viewModel.typographies.textFontToken)
                .optionalAnimation(
                    .easeInOut(duration: SegmentedControlConstants.animationDuration),
                    value: self.viewModel.typographies.textFontToken.font
                )
                .lineLimit(1)
        }
        .padding(self.viewModel.layout.padding)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(self.viewModel.colors.backgroundColorToken)
        .optionalAnimation(
            .easeInOut(duration: SegmentedControlConstants.animationDuration),
            value: self.viewModel.colors.backgroundColorToken.color
        )
        .scaleEffect(self.viewModel.isPressed ? 1.05 : 1.0)
        .optionalAnimation(
            .easeInOut(duration: SegmentedControlConstants.animationDuration),
            value: self.viewModel.isPressed
        )
        .contentShape(Rectangle())
        .onAppear() {
            self.viewModel.setup(
                theme: self.theme.value,
                isSelected: self.isSelected,
                isPressed: self.isPressed
            )
        }
        .onChange(of: self.theme) { theme in
            self.viewModel.theme = theme.value
        }
        .onChange(of: self.isSelected) { isSelected in
            self.viewModel.isSelected = isSelected
        }
        .onChange(of: self.isPressed) { isPressed in
            self.viewModel.isPressed = isPressed
        }
    }
}
