//
//  SparkBorder+WidthExtension.swift
//  SparkDemo
//
//  Created by robin.lemaire on 04/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

extension BorderDefault {

    enum Width: String, CaseIterable {
        case small
        case medium

        // MARK: - Properties

        static var `default`: Self = .medium

        // MARK: - Methods

        func value(from configuration: ComponentConfiguration) -> CGFloat {
            let width = configuration.theme.value.border.width

            return switch self {
            case .small: width.small
            case .medium: width.medium
            }
        }
    }
}
