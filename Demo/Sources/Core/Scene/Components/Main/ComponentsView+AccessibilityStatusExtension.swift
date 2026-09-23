//
//  ComponentsView+AccessibilityStatusExtension.swift
//  SparkDemo
//
//  Created by robin.lemaire on 19/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension ComponentsView {

    enum AccessibilityStatus: String, CaseIterable, Hashable {
        case all
        case none
        case available
        case unavailable

        var isAccessibility: Bool {
            self != .none
        }

        var color: Color {
            switch self {
            case .all: .primary
            case .none: .gray
            case .available: .green
            case .unavailable: .red
            }
        }
    }
}
