//
//  MicroAnimationnConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 31/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

class MicroAnimationConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var type: SparkAnimationType = .random
    var bellConfiguration = BellConfiguration()

    var isIndefinitely = false
    var numberOfRepeat: Int = Int.random(in: 1...5)

    // MARK: - Getter

    func getInfo() -> String {
        let value = switch self.getRepeat() {
        case .unlimited: "Indefinitely"
        case .limited(let value): "\(value) times"
        case .none: "Once"
        }

        return "Played " + value
    }

    func getRepeat() -> SparkAnimationRepeat {
        return if self.isIndefinitely {
            .unlimited
        } else if self.numberOfRepeat > 1 {
            .limited(self.numberOfRepeat)
        } else {
            .none
        }
    }

    // MARK: - Methods

    override func random() {
        self.type = .random
    }
}

// MARK: - Sub Configuration

extension MicroAnimationConfiguration {

    struct BellConfiguration {

        // MARK: - Properties

        var iconConfiguration = IconConfiguration()
        var iconButtonConfiguration = ButtonConfiguration()
        var buttonConfiguration = ButtonConfiguration()

        // MARK: - Initialization

        init() {
            let icon: Iconography = .bellOutline

            self.iconConfiguration.icon = icon
            self.iconConfiguration.intent = .main
            self.iconConfiguration.size = .medium

            self.iconButtonConfiguration.setIcon(icon)
            self.iconButtonConfiguration.intent = .main
            self.iconButtonConfiguration.variant = .filled
            self.iconButtonConfiguration.size = .medium

            self.buttonConfiguration.setIcon(icon)
            self.buttonConfiguration.intent = .main
            self.buttonConfiguration.variant = .filled
            self.buttonConfiguration.size = .medium
            self.buttonConfiguration.setTitle("My Button")
        }
    }
}
