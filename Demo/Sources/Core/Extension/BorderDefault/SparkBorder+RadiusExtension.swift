//
//  BorderDefault+RadiusExtension.swift
//  SparkDemo
//
//  Created by robin.lemaire on 04/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

extension BorderDefault {

    // MARK: - Radius

    enum Radius: String, CaseIterable {
        case none
        case small
        case medium
        case large
        case xLarge
        case full
        case custom

        // MARK: - Properties

        static var `default`: Self = .medium

        // MARK: - Methods

        func value(from configuration: ComponentConfiguration) -> CGFloat {
            let radius = configuration.theme.value.border.radius

            return switch self {
            case .none: radius.none
            case .small: radius.small
            case .medium: radius.medium
            case .large: radius.large
            case .xLarge: radius.xLarge
            case .full: radius.full
            case .custom: 0
            }
        }
    }
}
