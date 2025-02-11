//
//  TextFieldSideUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 11/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import UIKit

final class TextFieldSideUIView {

    // MARK: - Initialization

    static func sideView(
        theme: DemoThemes.Theme,
        sideViewContent: TextFieldSideViewContentType,
        side: TextFieldContentSide,
        isAddon: Bool
    ) -> UIView? {
        switch sideViewContent {
        case .none:
            return nil
        case .button:
            return Self.createButton(theme: theme, side: side, isAddon: isAddon)
        case .text:
            return self.createLabel(side: side, isAddon: isAddon)
        case .image:
            return Self.createImage(side: side, isAddon: isAddon)
        }
    }
    
    // MARK: - View

    private static func createImage(
        side: TextFieldContentSide,
        isAddon: Bool
    ) -> UIImageView {
        let configuration: (Iconography, UIColor) = switch (side, isAddon) {
        case (.left, true): (.infoOutline, .yellow)
        case (.right, true): (.arrowRight, .purple)
        case (.left, false): (.cross, .orange)
        case (.right, false): (.warningFill, .red)
        }

        let imageView: UIImageView = .init(image: .init(icon: configuration.0))
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = configuration.1

        return imageView
    }

    private static func createLabel(
        side: TextFieldContentSide,
        isAddon: Bool
    ) -> UILabel {
        let color: UIColor = switch (side, isAddon) {
        case (.left, true): .orange
        case (.right, true): .green
        case (.left, false): .purple
        case (.right, false): .blue
        }

        let label = UILabel()
        label.text = side.name
        label.textColor = color

        return label
    }

    private static func createButton(
        theme: DemoThemes.Theme,
        side: TextFieldContentSide,
        isAddon: Bool
    ) -> ButtonUIView {
        let intent: ButtonIntent = switch (side, isAddon) {
        case (.left, true): .danger
        case (.right, true): .success
        case (.left, false): .info
        case (.right, false): .alert
        }

        let button = ButtonUIView(
            theme: theme.value,
            intent: intent,
            variant: isAddon ? .tinted : .filled,
            size: isAddon ? .large : .small,
            shape: isAddon ? .square : .pill,
            alignment: .leadingImage
        )
        button.setTitle(side.rawValue, for: .normal)

        return button
    }
}
