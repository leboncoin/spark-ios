//
//  CircularMeterDisplayType.swift
//  SparkComponentCircularMeter
//
//  Created by robin.lemaire on 02/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

enum CircularMeterDisplayType: CaseIterable {
    case text
    case icon
    case image

    // MARK: - Properties

    static let `default` = CircularMeterDisplayType.text

    var isContent: Bool {
        switch self {
        case .text, .icon: true
        case .image: false
        }
    }
}
