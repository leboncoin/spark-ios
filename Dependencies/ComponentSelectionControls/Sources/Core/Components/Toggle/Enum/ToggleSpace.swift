//
//  ToggleSpace.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 04/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

enum ToggleSpace {
    case left
    case right

    // MARK: - Properties

    var showLeft: Bool {
        return self == .left
    }

    var showRight: Bool {
        return self == .right
    }
}
