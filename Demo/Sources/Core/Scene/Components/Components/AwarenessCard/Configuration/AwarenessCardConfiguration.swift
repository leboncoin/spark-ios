//
//  AwarenessCardConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 17/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

class AwarenessCardConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var intent: CardIntent = .default

    var icon: Iconography? = .infoOutline
    var isCustomContent: Bool = false
    var title: String = "Awareness Card"
    var titleSecondText = "is amazing"
    var description: String = "This is an awareness card to inform users about important information."
    var descriptionSecondText = "is amazing"
    var action: AwarenessCardActionType? = .textLink

    // MARK: - Initialization

    required init() {
        super.init()

        self.isEnabled.showConfiguration = true
    }

    // MARK: - Methods

    override func random() {
        self.intent = .random
        self.icon = .random
        self.isCustomContent = .random()
        self.action = .random
    }
}
