//
//  SnackbarConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 29/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

class SnackbarConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var intent: SnackbarIntent = .random
    var type: SnackbarType = .random
    var variant: SnackbarVariant = .random
    var icon: Iconography? = .optionalRandom
    var contentType: SnackbarContentType = .button // Because UIKit doesn't have allCases

    var text: String = "This is the snackbar text"
    var buttonTitle: String = "Tap"

    var maxNumberOfLines: Int = 0

    // MARK: - Initialization

    required init() {
        super.init()

        self.accessibilityLabel.showConfiguration = true
    }
}
