//
//  ButtonContainerView.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 24/11/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SwiftUI
import Foundation
@_spi(SI_SPI) import SparkCommon
import SparkTheming

@available(*, deprecated, message: "Not used anymore by SparkButton")
struct ButtonContainerView<ContainerView: View, ViewModel: ButtonMainViewModelDeprecated & ButtonMainSUIViewModelDeprecated>: View {

    // MARK: - Properties

    @ObservedObject private var viewModel: ViewModel

    private let padding: EdgeInsets?

    @State private var isPressed: Bool = false

    private let action: () -> Void

    // MARK: - Components

    private var contentView: () -> ContainerView

    // MARK: - Initialization

    init(
        viewModel: ViewModel,
        padding: EdgeInsets? = nil,
        action: @escaping () -> Void,
        contentView: @escaping () -> ContainerView
    ) {
        self.viewModel = viewModel

        self.padding = padding

        self.action = action
        self.contentView = contentView
    }

    // MARK: - View

    var body: some View {
        Button(action: self.action) {
            self.contentView()
                .padding(self.padding)
                .sparkFrame(height: self.viewModel.sizes?.height)
                .sparkFrame(minWidth: self.viewModel.sizes?.height)
                .background(self.viewModel.colors?.backgroundColor.color ?? .clear)
                .contentShape(Rectangle())
                .scaledBorder(
                    width: self.viewModel.border?.width,
                    radius: self.viewModel.border?.radius,
                    colorToken: self.viewModel.colors?.borderColor ?? ColorTokenDefault.clear
                )
        }
        .buttonStyle(PressedButtonStyle(
            isPressed: self.$isPressed
        ))
        .compositingGroup()
        .disabled(self.viewModel.state?.isUserInteractionEnabled == false)
        .opacity(self.viewModel.state?.opacity ?? .zero)
        .accessibilityIdentifier(ButtonAccessibilityIdentifier.button)
        .accessibilityShowsLargeContentViewer()
        .dynamicTypeSize(DynamicTypeSize.large...DynamicTypeSize.xxxLarge)
        .accessibilityAddTraits(.isButton)
        .sparkVisualIdentification()
        .onChange(of: self.isPressed) { isPressed in
            self.viewModel.setIsPressed(isPressed)
        }
    }
}

// MARK: - Modifier

private struct ButtonOptionalPaddingModifier: ViewModifier {

    // MARK: - Properties

    var padding: EdgeInsets?

    // MARK: - Initialization

    func body(content: Content) -> some View {
        if let padding = self.padding {
            content.padding(padding)
        } else {
            content
        }
    }
}

private extension View {

    func padding(_ padding: EdgeInsets?) -> some View {
        self.modifier(ButtonOptionalPaddingModifier(
            padding: padding
        ))
    }
}
