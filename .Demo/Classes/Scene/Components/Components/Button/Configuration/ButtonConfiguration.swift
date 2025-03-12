//
//  ButtonConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 29/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

class ButtonConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var intent: ButtonIntent = .random
    var variant: ButtonVariant = .random
    var size: ButtonSize = .random
    var shape: ButtonShape = .random
    var alignment: ButtonAlignment = .random
    var contentNormal = Content(state: .normal)
    var contentHighlighted = Content(state: .highlighted)
    var contentDisabled = Content(state: .disabled)
    var contentSelected = Content(state: .selected)

    // MARK: - SwiftUI Properties Only

    var swiftUIIsFullWidth: Bool = .random()
    var swiftUIIsToggle: Bool = .random()

    // MARK: - UIKit Properties Only

    var uiKitIsAnimated: Bool = .random()

    // MARK: - Initialization

    required init() {
        super.init()

        self.isEnabled.showConfiguration = true

        self.uiKitIsSelected.showConfiguration = true
        self.uiKitControlType.showConfiguration = true

        self.accessibilityLabel.showConfiguration = true
    }

    // MARK: - Getter

    override func isInvertedBackground() -> Bool {
        self.intent == .surface
    }
}

// MARK: - Sub Model

extension ButtonConfiguration {
    struct Content: Identifiable {

        // MARK: - Properties

        let id: ControlState
        var title: String
        var icon: Iconography? = .optionalRandom
        var isAttributedTitle: Bool = .random()

        // MARK: - Initialization

        init(state: ControlState) {
            let isNormalState = state == .normal
            self.id = state
            self.title = (isNormalState || Bool.random()) ? "My \(state) title" : ""
            self.icon = isNormalState ? .random : .optionalRandom
        }
    }
}
