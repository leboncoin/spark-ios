//
//  AdaptativeStackConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 01/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SwiftUI

class AdaptativeStackConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var text1: String = "My first text"
    var text2: String = "My second text"
    var text3: String = "My last text"

    var spacing: CGFloat = 0
    var accessibilitySpacing: CGFloat = 0

    var axis: AdaptiveStackAxis = .random
    var accessibilityAxis: AdaptiveStackAxis = .random

    var alignment: AdaptiveStackAlignment = .random
    var accessibilityAlignment: AdaptiveStackAlignment = .random

    // MARK: - Methods

    override func random() {
        self.axis = .random
        self.accessibilityAxis = .random
        self.alignment = .random
        self.accessibilityAlignment = .random
    }
}

// MARK: - Enum

enum AdaptiveStackAxis: String, CaseIterable {
    case horizontal
    case vertical

    var uiKit: NSLayoutConstraint.Axis {
        switch self {
        case .horizontal: .horizontal
        case .vertical: .vertical
        }
    }
}

enum AdaptiveStackAlignment: String, CaseIterable {
    case leading
    case center
    case trailing

    var swiftUI: Alignment {
        switch self {
        case .leading: .leading
        case .center: .center
        case .trailing: .trailing
        }
    }

    var uiKit: UIStackView.Alignment {
        switch self {
        case .leading: .leading
        case .center: .center
        case .trailing: .trailing
        }
    }
}
