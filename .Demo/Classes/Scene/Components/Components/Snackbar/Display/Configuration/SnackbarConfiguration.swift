//
//  SnackbarConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 29/01/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import Foundation

class SnackbarConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var intent: SnackbarIntent = .random
    var type: SnackbarType? = .optionalRandom
    var variant: SnackbarVariant? = .optionalRandom
    var icon: Iconography? = .optionalRandom
    var contentType: SnackbarContentType = .random

    var text: String = "This is the snackbar text"
    var buttonTitle: String = "Tap"

    var maxNumberOfLines: Int = 0

    // MARK: - Initialization

    required init() {
        super.init()

        self.accessibilityLabel.showConfiguration = true
    }
}
