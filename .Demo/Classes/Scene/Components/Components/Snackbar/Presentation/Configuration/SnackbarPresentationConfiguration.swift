//
//  SnackbarPresentationConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 29/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

class SnackbarPresentationConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var direction: SnackbarPresentationDirection = .random
    var autoDismissDelay: SnackbarAutoDismissDelay? = .optionalRandom

    var topInsetString: String = ""
    var leftInsetString: String = ""
    var rightInsetString: String = ""
    var bottomInsetString: String = ""
}
