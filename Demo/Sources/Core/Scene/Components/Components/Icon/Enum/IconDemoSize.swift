//
//  IconDemoSize.swift
//  SparkDemo
//
//  Created by robin.lemaire on 31/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

enum IconDemoSize: CaseIterable {
    case small
    case medium
    case large
    case extraLarge
    case custom

    // MARK: - Properties

    static let `default`: Self = {
        switch IconSize.default {
        case .small: .small
        case .medium: .medium
        case .large: .large
        case .extraLarge: .extraLarge
        case .custom: .custom
        }
    }()

    // MARK: - Methods

    func toRealType(_ configuration: IconConfiguration) -> IconSize {
        switch self {
        case .small: .small
        case .medium: .medium
        case .large: .large
        case .extraLarge: .extraLarge
        case .custom: .custom(CGFloat(configuration.sizeCustomValue))
        }
    }
}
