//
//  CommonGroup.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 22/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon
import SparkTheming

internal struct CommonGroup<Content>: View where Content: View {

    // MARK: - Properties

    @available(*, deprecated, message: "Remove the deprecated and this property ASAP. (02/02/2026)")
    private var deprecatedTheme: (any Theme)?

    @ViewBuilder private let content: () -> Content
    private var axis: SelectionControlsAxis = .default

    @Environment(\.theme) private var theme
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize

    @StateObject private var viewModel = CommonGroupViewModel()

    // MARK: - Initialization

    init(content: @escaping () -> Content) {
        self.content = content
    }

    init(
        theme: (any Theme)?,
        content: @escaping () -> Content
    ) {
        self.deprecatedTheme = theme
        self.content = content
    }

    // MARK: - View

    var body: some View {
        self.stack()
            .selectionControlsStyleContext(.group(axis: self.axis))
            .onAppear() {
                self.viewModel.setup(
                    theme: self.deprecatedTheme ?? self.theme.value,
                    axis: self.axis,
                    isAccessibilitySize: self.dynamicTypeSize.isAccessibilitySize
                )
            }
            .onChange(of: self.axis) { axis in
                self.viewModel.axis = axis
            }
            .onChange(of: self.dynamicTypeSize) { dynamicTypeSize in
                self.viewModel.isAccessibilitySize = dynamicTypeSize.isAccessibilitySize
            }
    }

    // MARK: - View Builder

    @ViewBuilder
    func stack() -> some View {
        switch self.axis {
        case .vertical:
            VStack(
                alignment: .leading,
                spacing: self.viewModel.spacing,
                content: self.content
            )

        case .horizontal:
            SparkAdaptiveStack(
                axis: .horizontal,
                alignment: .top,
                spacing: self.viewModel.spacing,
                accessibilityAlignment: .leading,
                content: self.content
            )
        }
    }

    // MARK: - View Modifier

    func axis(_ axis: SelectionControlsAxis) -> Self {
        var copy = self
        copy.axis = axis
        return copy
    }
}
