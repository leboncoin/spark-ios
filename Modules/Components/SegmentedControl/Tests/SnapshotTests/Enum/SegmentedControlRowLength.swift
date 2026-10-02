//
//  SegmentedControlRowLength.swift
//  SparkComponentSegmentedControlSnapshotTests
//
//  Created by Robin Lemaire on 02/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

enum SegmentedControlRowLength: Int, CaseIterable {
    case zero
    case one
    case two
    case three
    case four
    case five

    static var `default` = Self.four

    var value: Int {
        return switch self {
        case .zero: 0
        case .one: 1
        case .two: 2
        case .three: 3
        case .four: 4
        case .five: 5
        }
    }

    var items: SegmentedControlItems {
        return switch self {
        case .zero: .five
        case .one: .three
        case .two: .five
        case .three: .five
        default: .seven
        }
    }

    var width: CGFloat {
        return switch self {
        case .zero: 400
        default: 300
        }
    }
}
