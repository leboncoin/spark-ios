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
    private var placeholder: Placeholder
    private var cornerView: CornerView
    private let action: (() -> Void)?
    private let contentType: AvatarContentType

    @Environment(\.avatarActionType) private var actionType
    @Environment(\.avatarSize) private var size

    @State private var isPressed = false

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
        self.placeholder = placeholder()
        self.cornerView = cornerView()
    }

    // MARK: - View

    var body: some View {
        if let action {
            Button(action: {
                action()
                self.feedbackID = .init()
            }, label: self.content)
                .buttonStyle(PressedButtonStyle(isPressed: self.$isPressed))
        } else {
            self.content()
        }
    }

    private func content() -> some View {
        self.imageView()
        .avatarFrame()
        .avatarBackground(contentType: self.contentType)
        .avatarBorder(contentType: self.contentType)
        .overlay {
            // Corner View
            if !self.cornerView.isEmptyView {
                self.cornerView
                    .avatarCornerBadge()
                    .avatarCornerViewOffset(contentType: self.contentType)
            } else if self.action != nil, self.size.isIconButton {
                self.actionType?.icon
                    .resizable()
                    .scaledToFit()
                    .avatarAction(isPressed: self.isPressed)
                    .avatarCornerViewOffset(contentType: self.contentType)
            }
        }
        .avatarOpacity()
        .avatarScaleEffect(isPressed: self.isPressed)
        .optionalAnimation(
            .easeInOut(duration: AvatarConstants.animationDuration),
            value: self.isPressed
        )
        .sparkSensoryFeedback(.selection, trigger: self.feedbackID)
        .accessibilityIdentifier(AvatarAccessibilityIdentifier.view)
        .accessibilityElement(children: .ignore)
        .dynamicTypeSize(.large)
        .sparkVisualIdentification()
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
                self.placeholder
                    .avatarPlaceholder(contentType: self.contentType)
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
            .scaledToFill()
    }
}
