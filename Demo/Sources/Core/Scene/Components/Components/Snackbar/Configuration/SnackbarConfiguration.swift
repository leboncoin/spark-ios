//
//  SnackbarConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 29/01/2025.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

class SnackbarConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var autoDismissDelay: SnackbarAutoDismissDelay? = .optionalRandom

    var direction: SnackbarDirection = .default
    var intent: SnackbarIntent = .default
    var alignment: SnackbarAlignment = .default
    var icon: Iconography? = .optionalRandom

    var title: String = "Title"
    var message: String = "Snackbar placeholder"

    var hasButton: Bool = true
    var buttonTitle: String = "Tap"

    // MARK: - SwiftUI Properties Only

    var swiftUIIsCustomContent: Bool = false
    var swiftUISecondTitleText = "other"
    var swiftUISecondMessageText = "other"
    var swiftUIIsCompleted: Bool = false

    // MARK: - UIKit Properties Only

    var uiKitIsAttributedTitle: Bool = false
    var uiKitIsAttributedMessage: Bool = false
    var uiKitIsAnimated: Bool = true

    // MARK: - Initialization

    required init() {
        super.init()

        self.swiftUIFixHeight.value = false
    }

    // MARK: - Methods

    override func random() {
        self.autoDismissDelay = .optionalRandom
        self.direction = .random
        self.intent = .random
        self.alignment = .random
        self.icon = .random
        self.hasButton = .random()

        self.swiftUIIsCustomContent = .random()
        self.swiftUIIsCompleted = .random()

        self.uiKitIsAttributedTitle = .random()
        self.uiKitIsAttributedMessage = .random()
        self.uiKitIsAnimated = .random()
    }
}
