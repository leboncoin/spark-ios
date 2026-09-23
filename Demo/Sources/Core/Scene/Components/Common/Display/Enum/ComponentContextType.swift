//
//  ComponentContextType.swift
//  SparkDemo
//
//  Created by robin.lemaire on 05/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

/// Used only for the UIKit components.
enum ComponentContextType: CaseIterable {
    case display
    case configuration

    // MARK: - Properties

    var mayHaveOtherView: Bool {
        switch self {
        case .display: true
        case .configuration: false
        }
    }
}
