//
//  MicroAnimationnConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 31/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

// TODO: Tox fix :
// add CaseIterable on SparkCommon SparkAnimationType

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
}

// MARK: - Sub Configuration

extension MicroAnimationConfiguration {

    struct BellConfiguration {

        // MARK: - Properties

        var iconConfiguration = IconConfiguration()
        var iconButtonConfiguration = IconButtonConfiguration()
        var buttonConfiguration = ButtonConfiguration()

        // MARK: - Initialization

        init() {
            let icon: Iconography = .bellOutline

            self.iconConfiguration.icon = icon
            self.iconConfiguration.intent = .basic
            self.iconConfiguration.size = .medium

            self.iconButtonConfiguration.contentNormal.icon = icon
            self.iconButtonConfiguration.intent = .main
            self.iconButtonConfiguration.variant = .filled
            self.iconButtonConfiguration.size = .medium

            self.buttonConfiguration.contentNormal.icon = icon
            self.buttonConfiguration.intent = .main
            self.buttonConfiguration.variant = .filled
            self.buttonConfiguration.size = .medium
            self.buttonConfiguration.contentNormal.title = "My Button"
            self.buttonConfiguration.contentNormal.isAttributedTitle = false
        }
    }
}

// MARK: - Extension

extension SparkAnimationType: @retroactive CaseIterable {
    public static var allCases: [SparkAnimationType] = [.bell]
}
