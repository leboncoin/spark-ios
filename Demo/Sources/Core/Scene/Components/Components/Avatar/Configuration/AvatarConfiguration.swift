//
//  AvatarConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 24/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) import SparkComponentAvatar

class AvatarConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var type: AvatarType = .default
    var source: AvatarSource = .default
    var urlContainsImage: Bool = true
    var size: AvatarSize = .default
    var cornerType: AvatarCornerType?
    var isAction: Bool = false
    var actionType: AvatarActionType = .add
    var badgeIntent: BadgeIntent = .success
    var isBorder: Bool = false
    var username: String = "Bad cop"

    // MARK: - Initialization

    required init() {
        super.init()

        self.accessibilityLabel.showConfiguration = true
    }

    // MARK: - Methods

    override func random() {
        self.type = .random
        self.source = .random
        self.urlContainsImage = .random()
        self.size = .random
        self.cornerType = .random
        self.isAction = Bool.random()
        self.actionType = .random
        self.isBorder = .random()
    }
}
