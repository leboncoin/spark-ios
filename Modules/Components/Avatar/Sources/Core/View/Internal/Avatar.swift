//
//  Avatar.swift
//  SparkComponentAvatar
//
//  Created by robin.lemaire on 02/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming
import SparkComponentBadge
@_spi(SI_SPI) import SparkCommon

struct Avatar<Placeholder, CornerView>: View where Placeholder: View, CornerView: View {

    // MARK: - Properties

    private let source: AvatarSource
    private var placeholder: () -> Placeholder
    private var cornerView: () -> CornerView
    private let action: (() -> Void)?
    private let contentType: AvatarContentType

    @Environment(\.theme) private var theme
    @Environment(\.avatarActionType) private var actionType
    @Environment(\.avatarIsBorder) private var isBorder
    @Environment(\.avatarSize) private var size
    @Environment(\.isEnabled) private var isEnabled

    @StateObject private var viewModel = AvatarViewModel()

    @State var cornerViewSize: CGSize?
    @State private var showImage = false
    @State private var feedbackID = UUID()

    // MARK: - Initialization

    init(
        source: AvatarSource,
        contentType: AvatarContentType,
        action: (() -> Void)?,
        @ViewBuilder placeholder: @escaping () -> Placeholder,
        @ViewBuilder cornerView: @escaping () -> CornerView
    ) {
        self.source = source
        self.contentType = contentType
        self.action = action
        self.placeholder = placeholder
        self.cornerView = cornerView
    }

    // MARK: - View

    var body: some View {
        if let action {
            Button(action: {
                action()
                self.feedbackID = .init()
            }, label: self.content)
                .buttonStyle(PressedButtonStyle(isPressed: self.$viewModel.isPressed))
        } else {
            self.content()
        }
    }

    private func content() -> some View {
        self.imageView()
        .sparkFrame(size: self.viewModel.sizes.size)
        .background(self.viewModel.colors.backgroundColorToken)
        .sparkBorder(
            width: self.viewModel.border.width,
            radius: self.viewModel.border.radius,
            colorToken: self.viewModel.colors.borderColorToken
        )
        .overlay {
            // Corner View
            if !self.cornerView().isEmptyView {
                self.cornerView()
                    .sparkBadgeSize(self.viewModel.sizes.badgeSize)
                    .sparkBadgeIsBorder(true)
                    .offset(self.viewModel.getCornerViewOffset(cornerViewSize: self.cornerViewSize))
                    .onGeometryChange(for: CGSize.self) { proxy in
                        proxy.size
                    } action: { newValue in
                        self.cornerViewSize = newValue
                    }
            } else if self.action != nil, self.size.isIconButton {
                self.actionType?.icon
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(self.viewModel.colors.actionTintColorToken)
                    .padding(self.viewModel.layout.actionPadding)
                    .sparkFrame(size: self.viewModel.sizes.actionSize)
                    .background(
                        Circle()
                            .fill(self.viewModel.colors.actionBackgroundColorToken)
                            .shadow(self.theme.value.elevation.dropShadow)
                    )
                    .offset(self.viewModel.getCornerViewOffset(cornerViewSize: self.cornerViewSize))
                    .onGeometryChange(for: CGSize.self) { proxy in
                        proxy.size
                    } action: { newValue in
                        self.cornerViewSize = newValue
                    }
            }
        }
        .opacity(self.viewModel.dim)
        .scaleEffect(self.viewModel.scaleEffect)
        .optionalAnimation(
            .easeInOut(duration: AvatarConstants.animationDuration),
            value: self.viewModel.isPressed
        )
        .sparkSensoryFeedback(.selection, trigger: self.feedbackID)
        .accessibilityIdentifier(AvatarAccessibilityIdentifier.view)
        .accessibilityElement(children: .ignore)
        .dynamicTypeSize(.large)
        .onAppear {
            self.viewModel.setup(
                theme: self.theme.value,
                contentType: self.contentType,
                size: self.size,
                isBorder: self.isBorder,
                isEnabled: self.isEnabled
            )
        }
        .onChange(of: self.theme) { _ in
            self.viewModel.theme = self.theme.value
        }
        .onChange(of: self.contentType) { contentType in
            self.viewModel.contentType = contentType
        }
        .onChange(of: self.size) { size in
            self.viewModel.size = size
        }
        .onChange(of: self.isBorder) { isBorder in
            self.viewModel.isBorder = isBorder
        }
        .onChange(of: self.isEnabled) { isEnabled in
            self.viewModel.isEnabled = isEnabled
        }
    }

    @ViewBuilder
    private func imageView() -> some View {
        switch self.source {
        case .url(let value):
            AsyncImage(url: value) { image in
                image
                    .stylized()
                    .opacity(self.showImage ? 1 : 0)
                    .onAppear {
                        withOptionalAnimation {
                            self.showImage = true
                        }
                    }
            } placeholder: {
                self.placeholder()
                    .foregroundStyle(self.viewModel.colors.placeholderTintColorToken)
                    .font(self.viewModel.typographies.placeholderFontToken)
                    .sparkFrame(size: self.viewModel.sizes.placeholderSize)
            }
        case .image(let value):
            value.stylized()
        }
    }
}

// MARK: - Extension

private extension Image {

    func stylized() -> some View {
        self.resizable()
            .aspectRatio(contentMode: .fill)
    }
}
