//
//  SegmentedGaugeAccessibilitySort.swift
//  SparkComponentSegmentedGauge
//
//  Created by robin.lemaire on 20/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

enum SegmentedGaugeAccessibilitySort: Double {
    case title = 3
    case description = 2
    case segments = 1
}

// MARK: - View

internal extension View {

    func accessibilitySort(_ sort: SegmentedGaugeAccessibilitySort) -> some View {
        self.accessibilitySortPriority(sort.rawValue)
    }
}
