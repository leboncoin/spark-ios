//
//  ButtonConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 29/01/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import Foundation

class ButtonConfiguration: ComponentConfiguration {

    // MARK: - Sub Model

    struct Content: Identifiable {
        let id: ControlState
        var text: String
        var icon: Iconography? = .optionalRandom
        var isAttributedText: Bool = .random()

        init(state: ControlState) {
            let isNormalState = state == .normal
            self.id = state
            self.text = (isNormalState || Bool.random()) ? "My \(state) title" : ""
            self.icon = isNormalState ? .random : .optionalRandom
        }
    }

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
    var isFullWidth: Bool = .random()
    var isToggle: Bool = .random()

    // MARK: - Initialization

    required init() {
        super.init()

        self.isEnabled.showConfiguration = true
        self.accessibilityLabel.showConfiguration = true
    }

    // MARK: - Getter

    override func isInvertedBackground() -> Bool {
        self.intent == .surface
    }
}
