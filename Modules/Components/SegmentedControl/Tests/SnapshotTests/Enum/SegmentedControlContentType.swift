//
//  SegmentedControlContentType.swift
//  SparkComponentSegmentedControlSnapshotTests
//
//  Created by Robin Lemaire on 02/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

enum SegmentedControlContentType: String, CaseIterable {
    case icon
    case text
    case iconAndText
    case label

    static var `default` = Self.text

    var documentationName: String {
        return switch self {
        case .icon: "icons"
        case .text: "texts"
        case .iconAndText: "icons_and_texts"
        case .label: "label"
        }
    }
}
