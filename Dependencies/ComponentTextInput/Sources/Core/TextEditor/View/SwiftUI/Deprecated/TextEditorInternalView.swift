//
//  TextEditorInternalView.swift
//  SparkComponentTextInput
//
//  Created by robin.lemaire on 08/11/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming

@available(*, deprecated, message: "Use SparkTextEditor instead")
internal struct TextEditorInternalView: View {

    // MARK: - Properties

    private let title: String

    @Binding private var text: String

    @ScaledMetric private var minHeight: CGFloat = 38
    @ScaledMetric private var horizontalPadding: CGFloat
    @ScaledMetric private var scaleFactor: CGFloat = 1.0

    @ObservedObject private var viewModel: TextEditorUIViewModel

    // MARK: - Initialization

    init(
        title: String,
        text: Binding<String>,
        viewModel: TextEditorUIViewModel
    ) {
        self.title = title
        self._text = text
        self.viewModel = viewModel

        self._horizontalPadding = .init(wrappedValue: (viewModel.theme.layout.spacing.large - 4))
    }

    init(
        title: String,
        text: Binding<String>,
        theme: any Theme,
        intent: TextEditorIntent
    ) {
        self.title = title
        self._text = text
        let viewModel = TextEditorUIViewModel(
            theme: theme,
            intent: intent
        )
        self.viewModel = viewModel

        self._horizontalPadding = .init(wrappedValue: (viewModel.theme.layout.spacing.large - 4))
    }

    // MARK: - View

    var body: some View {
        ZStack {
            TextEditor(text: .constant(self.title))
                .foregroundStyle(self.viewModel.placeholderColor.color)
                .opacity(self.text.isEmpty ? 1.0 : 0.0)
                .disabled(true)
                .frame(minHeight: self.minHeight)

            TextEditor(text: self.$text)
                .foregroundStyle(self.viewModel.textColor.color)
                .tint(self.viewModel.textColor.color)
                .scrollIndicators(.visible)
        }
        .frame(minHeight: self.minHeight)
        .font(self.viewModel.font.font)
        .padding(.zero)
        .scrollContentBackground(.hidden)
        .padding(.horizontal, self.horizontalPadding)
        .border(
            width: self.viewModel.borderWidth * self.scaleFactor,
            radius: .textEditorRadius(self.viewModel.borderRadius) * self.scaleFactor,
            colorToken: self.viewModel.borderColor
        )
        .opacity(self.viewModel.dim)
        .accessibilityElement()
        .accessibilityIdentifier(TextEditorAccessibilityIdentifier.view)
        .accessibilityLabel(self.title)
        .accessibilityValue(self.text)
    }

    // MARK: - Update

    func isEnabled(_ isEnabled: Bool) -> Self {
        self.viewModel.isEnabled = isEnabled
        return self
    }

    func isFocused(_ isFocused: Bool) -> Self {
        self.viewModel.isFocused = isFocused
        return self
    }
}
