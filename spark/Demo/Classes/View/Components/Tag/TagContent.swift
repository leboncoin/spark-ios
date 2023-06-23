//
//  TagContent.swift
//  SparkDemo
//
//  Created by robin.lemaire on 21/06/2023.
//  Copyright © 2023 Adevinta. All rights reserved.
//

enum TagContent: CaseIterable {
    case icon
    case text
    case all

    // MARK: - Properties

    var showIcon: Bool {
        switch self {
        case .icon, .all:
            return true
        default:
            return false
        }
    }

    var showText: Bool {
        switch self {
        case .text, .all:
            return true
        default:
            return false
        }
    }
}
