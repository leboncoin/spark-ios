//
//  TextFieldViewInternal.swift
//  SparkTextField
//
//  Created by louis.borlee on 18/04/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon
import SparkTheming

struct TextFieldViewInternal<LeftView: View, RightView: View>: View {

    // MARK: - Properties

    @ScaledMetric private var height: CGFloat = TextInputConstants.height
    @ScaledMetric private var scaleFactor: CGFloat = 1.0

    @ObservedObject private var viewModel: TextInputUIViewModel
    @Binding private var text: String

    @State var textFieldID: String = UUID().uuidString
    @FocusState private var isFocused: Bool
    @Environment(\.textFieldClearMode) private var clearMode

    private let titleKey: LocalizedStringKey
    private var type: TextFieldViewType

    private let leftView: () -> LeftView
    private let rightView: () -> RightView

    // MARK: - Initialization

    init(titleKey: LocalizedStringKey,
         text: Binding<String>,
         viewModel: TextInputUIViewModel,
         type: TextFieldViewType,
         leftView: @escaping (() -> LeftView),
         rightView: @escaping (() -> RightView)) {
        self.titleKey = titleKey
        self._text = text
        self.viewModel = viewModel
        self.type = type
        self.leftView = leftView
        self.rightView = rightView
    }

    // MARK: - View

    var body: some View {
        ZStack {
            self.viewModel.backgroundColor.color
            contentView()
        }
        .tint(self.viewModel.textColor.color)
        .allowsHitTesting(!self.viewModel.isReadOnly)
        .border(
            width: self.viewModel.borderWidth * self.scaleFactor,
            radius: self.viewModel.borderRadius * self.scaleFactor,
            colorToken: self.viewModel.borderColor
        )
        .frame(height: self.height)
        .opacity(self.viewModel.dim)
    }

    // MARK: - ViewBuilder

    @ViewBuilder
    private func contentView() -> some View {
        let showClearButton = self.clearMode.mode.showClearButton(isFocused: self.isFocused)

        HStack(spacing: self.viewModel.contentSpacing) {
            // Left View
            self.leftView()

            HStack(spacing: showClearButton ? .zero : self.viewModel.contentSpacing) {
                // TextField
                self.textField()
                    .focused(self.$isFocused)
                    .id(self.textFieldID)

                // Clear Button
                if showClearButton {
                    Button {
                        self.text = ""
                        self.textFieldID = UUID().uuidString
                    } label: {
                        Image(systemName: Constants.clearButtonImageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaledFrame(
                                width: Constants.clearButtonSize,
                                height: Constants.clearButtonSize,
                                relativeTo: .body
                            )
                            .foregroundColor(Color(uiColor: .tertiaryLabel))
                            .frame(maxHeight: .infinity)
                            .scaledFrame(width: TextInputConstants.height)
                            .aspectRatio(1, contentMode: .fit)
                    }
                    .accessibilityLabel(.init(Constants.clearButtonLabelKey, bundle: .current))
                    .accessibilityIdentifier(TextFieldAccessibilityIdentifier.clearButton)
                    .accessibilityShowsLargeContentViewer {
                        Image(systemName: Constants.clearButtonImageName)
                        Text(Constants.clearButtonLabelKey, bundle: .current)
                    }
                    .dynamicTypeSize(...DynamicTypeSize.accessibility3)
                    .accessibilityAddTraits(.isButton)
                } else {
                    // Right View
                    self.rightView()
                }
            }
        }
        .padding(.init(
            top: .zero,
            leading: self.viewModel.leftSpacing,
            bottom: .zero,
            trailing: showClearButton ? .zero : self.viewModel.rightSpacing
        ))
    }

    @ViewBuilder
    private func textField() -> some View {
        Group {
            switch type {
            case .secure(let onCommit):
                SecureField(titleKey, text: self.$text, onCommit: onCommit)
            case .standard(let onEditingChanged, let onCommit):
                TextField(titleKey, text: self.$text, onEditingChanged: onEditingChanged, onCommit: onCommit)

            }
        }
        .font(self.viewModel.font.font)
        .textFieldStyle(.plain)
        .foregroundStyle(self.viewModel.textColor.color)
        .accessibilityIdentifier(TextFieldAccessibilityIdentifier.view)
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

// MARK: - Constants

private enum Constants {
    static let clearButtonSize: CGFloat = 17
    static let clearButtonImageName = "multiply.circle.fill"
    static let clearButtonLabelKey: LocalizedStringKey = "accessibility_clear_button_label"
}
