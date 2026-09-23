//
//  ScaledState.swift
//  SparkCommon
//
//  Created by robin.lemaire on 01/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

enum ScaledState: String, Hashable, CaseIterable {
    case scaled
    case scaledMetric
    case withoutScaling

    // MARK: - Properties

    var name: String {
        switch self {
        case .scaled: "Scaled properly"
        case .scaledMetric: "@ScaledMetric 🚫"
        case .withoutScaling: "Without scaling"
        }
    }

    var isLatest: Bool {
        self == Self.allCases.last
    }
}
