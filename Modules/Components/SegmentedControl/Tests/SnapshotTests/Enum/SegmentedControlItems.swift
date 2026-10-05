//
//  SegmentedControlItems.swift
//  SparkComponentSegmentedControlSnapshotTests
//
//  Created by Robin Lemaire on 02/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

enum SegmentedControlItems: Int, CaseIterable {
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight

    static var `default` = Self.three

    var count: Int {
        return switch self {
        case .two: 2
        case .three: 3
        case .four: 4
        case .five: 5
        case .six: 6
        case .seven: 7
        case .eight: 8
        }
    }

    var documentationName: String? {
        return switch self {
        case .two: nil
        case .three: "three_items"
        case .four: nil
        case .five: nil
        case .six: "six_items"
        case .seven: "seven_items"
        case .eight: nil
        }
    }
}
