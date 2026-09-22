//
//  View+LabelStyleExtension.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 30/07/2025.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

extension View {

    // MARK: - Style

    func applyLabelStyle(
        titleStyle: CommonTitleStyle,
        minHeight: CGFloat
    ) -> some View {
        self.font(titleStyle.typography)
            .foregroundStyle(titleStyle.color)
            .frame(minHeight: minHeight)
            .contextFrame()
    }

    func applyHiddenLabelStyle(
        showHiddenEmptyLabel: Bool,
        titleStyle: CommonTitleStyle,
        width: CGFloat
    ) -> some View {
        self.hiddenLabel(
            showHiddenEmptyLabel: showHiddenEmptyLabel,
            titleStyle: titleStyle
        )
        .lineLimit(1)
        .frame(width: width, alignment: .top)
        .hidden()
    }

    // MARK: - View

    @ViewBuilder
    private func hiddenLabel(viewModel: CommonViewModel) -> some View {
        if viewModel.showHiddenEmptyLabel {
            Text(" ")
                .font(viewModel.titleStyle.typography)
        } else {
            self
        }
    }

    @ViewBuilder
    private func hiddenLabel(
        showHiddenEmptyLabel: Bool,
        titleStyle: CommonTitleStyle
    ) -> some View {
        if showHiddenEmptyLabel {
            Text(" ")
                .font(titleStyle.typography)
        } else {
            self
        }
    }
}
