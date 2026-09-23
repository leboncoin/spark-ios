//
//  ChipConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 30/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

class ChipConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var intent: ChipIntent = .default {
        didSet {
            self.badgeConfiguration.intent = self.intent.badge
        }
    }
    var variant: ChipVariant = .default
    var alignment: ChipAlignment = .default
    var size: ChipSize = .default
    var text = "My Chip"
    var icon: Iconography? = .optionalRandom
    var withExtraComponent: Bool = .random()
    var isSelected: Bool = false

    var badgeConfiguration = BadgeConfiguration()

    // MARK: - SwiftUI Properties Only

    var swiftUIIsCustomContent: Bool = false
    var swiftUISecondText = "is amazing"
    var swiftUIWithAction: Bool = .random()

    // MARK: - UIKit Properties Only

    var uiKitIsAttributedText = false

    // MARK: - Initialization

    required init() {
        super.init()

        self.isEnabled.showConfiguration = true

        self.accessibilityLabel.showConfiguration = true
        self.accessibilityLargeContentTitle.showConfiguration = true
        self.uiKitControlType.showConfiguration = true
        self.uiKitControlType.cases = ComponentControlType.classic

        self.badgeConfiguration.isValue = true
        self.badgeConfiguration.isAttached = false
        self.badgeConfiguration.size = .small
    }

    // MARK: - Getter

    override func isInvertedBackground() -> Bool {
        self.intent == .surface
    }

    // MARK: - Methods

    override func random() {
        self.intent = .random
        self.variant = .random
        self.alignment = .random
        self.size = .random
        self.icon = .random
        self.withExtraComponent = .random()
        self.isSelected = .random()
    }
}

private extension ChipIntent {

    // MARK: - Properties

    var badge: BadgeIntent {
        switch self {
        case .accent: .accent
        case .alert: .alert
        case .danger: .danger
        case .info: .info
        case .main: .main
        case .neutral: .neutral
        case .success: .success
        case .support: .support
        case .surface: .main
        }
    }
}
