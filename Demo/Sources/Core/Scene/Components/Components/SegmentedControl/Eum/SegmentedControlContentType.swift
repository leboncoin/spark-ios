//
//  SegmentedControlContentType.swift
//  SparkDemo
//
//  Created by robin.lemaire on 25/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

enum SegmentedControlContentType: CaseIterable {
    case icon
    case text
    case iconAndText
    case custom
    case multiple

    // MARK: - Properties

    static let `default` = SegmentedControlContentType.text

    static let multipleCases = Self.allCases.filter { $0 != .multiple }

    var isIcon: Bool {
        switch self {
        case .icon, .iconAndText, .custom: true
        default: false
        }
    }

    var isText: Bool {
        switch self {
        case .text, .iconAndText, .custom: true
        default: false
        }
    }
}
