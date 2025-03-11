//
//  TextFieldSideUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 11/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit

final class TextFieldSideUIView<
    Configuration: ComponentConfiguration,
    ComponentView: UIView,
    ConfigurationView: ConfigurationUIViewable<Configuration, ComponentView>,
    ViewMaker: ComponentUIViewMaker<Configuration, ComponentView, ConfigurationView>
>{

    // MARK: - Properties

    var viewMaker: ViewMaker?

    // MARK: - Create

    func createSideView(
        configuration: Configuration,
        sideViewContent: TextFieldSideViewContentType,
        side: TextFieldContentSide,
        isAddon: Bool
    ) -> UIView? {
        switch sideViewContent {
        case .none:
            return nil
        case .button:
            return self.createButton(configuration: configuration, side: side, isAddon: isAddon)
        case .text:
            return self.createLabel(side: side, isAddon: isAddon)
        case .image:
            return self.createImage(side: side, isAddon: isAddon)
        }
    }

    // MARK: - Subview

    private func createImage(
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

    private func createLabel(
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

    private func createButton(
        configuration: Configuration,
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
            theme: configuration.theme.value,
            intent: intent,
            variant: isAddon ? .tinted : .filled,
            size: isAddon ? .large : .small,
            shape: isAddon ? .square : .pill,
            alignment: .leadingImage
        )
        button.setTitle(side.rawValue, for: .normal)
        button.demoControlType(configuration, on: self.viewMaker?.viewController)

        return button
    }
}
