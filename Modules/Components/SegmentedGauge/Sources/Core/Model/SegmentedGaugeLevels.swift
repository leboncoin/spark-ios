//
//  SegmentedGaugeLevels.swift
//  SparkComponentSegmentedGauge
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

struct SegmentedGaugeLevels: Equatable {

    // MARK: - Properties

    var currentLevel: Int = .zero
    var levels: Int = 1

    var accessibilityLabel: String {
        let stringKey = String(localized: "accessibility_label_segments", bundle: .current)
        return String(format: stringKey, currentLevel, levels)
    }

    // MARK: - Methods

    func displayMarker(at index: Int, withMarker: Bool) -> Bool {
        return withMarker && index == self.currentLevel
    }

    func isPlainSegment(at index: Int) -> Bool {
        return index <= self.currentLevel
    }

    func isSegment(at index: Int) -> Bool {
        return index <= self.levels
    }
}
