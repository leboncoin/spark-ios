//
//  BadgeGetTextUseCase.swift
//  SparkComponentBadge
//
//  Created by robin.lemaire on 10/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol BadgeGetTextUseCaseable {
    func execute(value: Int?, unit: String?) -> String?
}

final class BadgeGetTextUseCase: BadgeGetTextUseCaseable {

    // MARK: - Methods

    func execute(value: Int?, unit: String?) -> String? {
        guard let value else {
            return nil
        }

        let maxValue = 99
        let string = if value > maxValue {
            String(maxValue) + "+"
        } else {
            String(value)
        }

        return if let unit {
            string + unit
        } else {
            string
        }
    }
}
