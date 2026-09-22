//
//  CardConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 02/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

class CardConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var intent: CardIntent = .default
    var variant: CardVariant = .default
    var isHighlighted: Bool = false

    var tag = TagConfiguration()
    var icon = IconConfiguration()
    var button = ButtonConfiguration()

    // MARK: - SwiftUI Properties Only

    var swiftUIPadding: CardPadding = .default
    var swiftUIWithAction: Bool = false

    var swiftUIHeader: String = "New !"
    var swiftUIHeaderPosition: CardHeaderPosition = .default
    var swiftUIHeaderIsCustomContent: Bool = false
    var swiftUIHeaderSecondText = "is amazing"

    // MARK: - UIKit Properties Only

    var uiKitIsAttributedHeader = false
    var uiKitIsPadding = true

    // MARK: - Initialization

    required init() {
        super.init()

        self.isEnabled.showConfiguration = true

        self.uiKitControlType.showConfiguration = true
        self.uiKitControlType.cases = ComponentControlType.classic

        self.tag.size = .medium
        self.tag.intent = .info
        self.tag.icon = .check

        self.icon.size = .medium
        self.icon.intent = .info
        self.icon.icon = .infoOutline

        self.button.setTitle("Tap")
        self.button.uiKitContentHighlighted.title = ""
        self.button.uiKitIsSelected.value = false
        self.button.isEnabled.value = true
        self.button.swiftUIIsFullWidth = false
        self.button.uiKitControlType.value = .action
    }

    // MARK: - Getter

    override func isInvertedBackground() -> Bool {
        if self.variant == .outlined {
            return false
        } else if self.intent != .surface {
            return false
        } else {
            return true
        }
    }

    // MARK: - Methods

    override func random() {
        self.intent = .random
        self.isHighlighted = .random()
        self.swiftUIPadding = .random
        self.uiKitIsPadding = .random()
        self.variant = .random
        self.swiftUIHeaderPosition = .random
    }
}
