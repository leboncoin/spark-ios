//
//  ButtonConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 29/01/2025.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

class ButtonConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var appearance: ButtonAppearance? = .default
    var intent: ButtonIntent = .default
    var variant: ButtonVariant = .default
    var alignment: ButtonAlignment = .default
    var shape: ButtonShape = .default
    var size: ButtonSize = .default
    var hasFeedback: Bool = false
    var isLoading: Bool = false
    var removeStyles: Bool = false
    var animateIcon: Bool = false
    var contentVisibility: ButtonContentVisibility = .default

    // MARK: - SwiftUI Properties Only

    var swiftUIIsMenu: Bool = false
    var swiftUIIsFullWidth: Bool = false
    var swiftUIIcon: Iconography? = .random
    var swiftUITitle: String = "My Button"
    var swiftUIIsCustomContent: Bool = false
    var swiftUISecondText = "is amazing"

    // MARK: - UIKit Properties Only

    var uiKitContentNormal = Content(state: .normal)
    var uiKitContentHighlighted = Content(state: .highlighted)
    var uiKitContentDisabled = Content(state: .disabled)
    var uiKitContentSelected = Content(state: .selected)

    // MARK: - Initialization

    required init() {
        super.init()

        self.isEnabled.showConfiguration = true

        self.uiKitIsSelected.showConfiguration = true
        self.uiKitIsSelected.value = false
        self.uiKitControlType.showConfiguration = true

        self.accessibilityLabel.showConfiguration = true
    }

    // MARK: - Getter

    override func isInvertedBackground() -> Bool {
        self.intent == .surface
    }

    // MARK: - Setter

    func setIcon(_ icon: Iconography) {
        self.swiftUIIcon = icon
        self.uiKitContentNormal.icon = icon
    }

    func setTitle(_ title: String) {
        self.swiftUITitle = title
        self.uiKitContentNormal.title = title
    }

    // MARK: - Methods

    override func random() {
        self.appearance = .optionalRandom
        self.intent = .random
        self.variant = .random
        self.size = .random
        self.alignment = .random
        self.animateIcon = .random()
        self.swiftUIIsMenu = .random()
        self.swiftUIIsFullWidth = .random()
        self.swiftUIIcon = .random
        self.swiftUIIsCustomContent = .random()
    }
}

// MARK: - Sub Model

extension ButtonConfiguration {
    struct Content: Identifiable {

        // MARK: - Properties

        let id: ButtonControlState
        var title: String
        var isAttributedTitle: Bool = false
        var icon: Iconography? = .optionalRandom

        // MARK: - Initialization

        init(state: ButtonControlState) {
            let isNormalState = state == .normal
            self.id = state
            self.title = (isNormalState || Bool.random()) ? "My \(state) title" : ""
            self.icon = isNormalState ? .random : .optionalRandom
        }
    }
}
