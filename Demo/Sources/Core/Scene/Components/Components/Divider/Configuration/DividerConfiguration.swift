//
//  DividerConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 28/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

class DividerConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var intent: DividerIntent = .default
    var axis: DividerAxis = .default
    var alignment: DividerAlignment = .default
    var text: String = "Divider"

    // MARK: - UIKit Properties Only

    var uiKitIsAttributedText: Bool = false

    // MARK: - SwiftUI Properties Only

    var swiftUIIsCustomContent: Bool = false
    var swiftUISecondText = "is amazing"

    // MARK: - Initialization

    required init() {
        super.init()

        self.accessibilityLabel.showConfiguration = true
    }

    // MARK: - Methods

    override func random() {
        self.alignment = .random
    }
}
