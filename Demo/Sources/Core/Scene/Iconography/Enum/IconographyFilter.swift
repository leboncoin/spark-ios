//
//  IconographyFilter.swift
//  SparkDemo
//
//  Created by robin.lemaire on 17/09/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

enum IconographyFilter: String, CaseIterable, Hashable {
    case all
    case criteria
    case global

    // MARK: - Properties

    var name: String {
        switch self {
        case .all: "All"
        case .criteria: "Criteria"
        case .global: "Global"
        }
    }
}
