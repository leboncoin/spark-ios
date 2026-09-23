//
//  PopoverConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 29/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

class PopoverConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var intent: PopoverIntent = .random
    var text: String = "This is the snackbar text"

    // MARK: - UIKit Properties Only

    var uiKitShowArrow: Bool = .random()

    // MARK: - Methods

    override func random() {
        self.intent = .random
        self.uiKitShowArrow = .random()
    }
}
