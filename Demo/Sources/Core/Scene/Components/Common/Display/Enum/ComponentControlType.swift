//
//  ComponentControlType.swift
//  SparkDemo
//
//  Created by robin.lemaire on 10/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

/// Used only for the UIKit components.
enum ComponentControlType: String, CaseIterable {
    case publisher
    case action
    case target
    case toggle // Only for the button

    // MARK: - Properties

    /// Only action and target
    static var classic: [Self] {
        [.action, .target]
    }

    static var withoutToggle: [Self] {
        self.allCases.filter { $0 != toggle }
    }

    static var withoutPublisher: [Self] {
        self.allCases.filter { $0 != toggle }
    }
}
