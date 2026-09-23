//
//  ClearButton.swift
//  SparkComponentFormField
//
//  Created by robin.lemaire on 14/05/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming

internal struct ClearButton: View {

    // MARK: - Properties

    let title: String
    let icon: Image
    let action: @MainActor () -> Void

    private var spacing: CGFloat?
    private var font: (any TypographyFontToken)?
    private var foregroundStyle: (any ColorToken)?

    @ScaledMetric private var iconSize = FormFieldConstants.iconSize
    @Environment(\.dynamicTypeSize) var dynamicTypeSize

    // MARK: - Initialization

    init(title: String?, icon: Image, action: @escaping @MainActor () -> Void) {
        self.title = title ?? FormFieldConstants.defaultTitle
        self.icon = icon
        self.action = action
    }

    // MARK: - View

    var body: some View {
        Button(action: self.action, label: {
            HStack(spacing: self.spacing) {
                Text(self.title)
                    .font(self.font?.font)

                self.icon
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(
                        width: self.iconSize,
                        height: self.iconSize
                    )
            }
            .foregroundStyle(self.foregroundStyle?.color ?? .clear)
        })
        .buttonStyle(.plain)
        .accessibilityShowsLargeContentViewer {
            self.icon
            Text(self.title)
        }
    }

    // MARK: - View Modifier

    func spacing(_ value: CGFloat) -> Self {
        var copy = self
        copy.spacing = value
        return copy
    }

    func font(_ font: any TypographyFontToken) -> Self {
        var copy = self
        copy.font = font
        return copy
    }

    func foregroundStyle(_ color: any ColorToken) -> Self {
        var copy = self
        copy.foregroundStyle = color
        return copy
    }
}
