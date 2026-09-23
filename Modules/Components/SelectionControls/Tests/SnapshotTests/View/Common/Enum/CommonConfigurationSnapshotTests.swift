//
//  CommonConfigurationSnapshotTests.swift
//  SparkComponentSelectionControlsSnapshotTests
//
//  Created by robin.lemaire on 11/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

enum CommonStatus: String, CaseIterable {
    case enabled
    case disabled

    var isEnabled: Bool {
        switch self {
        case .enabled: true
        case .disabled: false
        }
    }
}

enum CommonContentResilience: String, CaseIterable {
    case withoutLabel
    case shortLabel
    case multilineLabel
    case other

    var text: String? {
        switch self {
        case .withoutLabel: nil
        case .shortLabel: "My component"
        case .multilineLabel: "My component. Lorem ipsum dolor.\nConsectetur adipiscing elit.\nProin vel metus pretium."
        case .other: nil
        }
    }
}

enum CommonGroupContentResilience: String, CaseIterable {
    case shortLabel
    case multilineLabel

    var text: String {
        switch self {
        case .shortLabel: "My component"
        case .multilineLabel: "My component.\nLorem ipsum dolor."
        }
    }
}
