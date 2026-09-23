//
//  RadiusState.swift
//  SparkCommon
//
//  Created by robin.lemaire on 01/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

enum RadiusState: String, Hashable, CaseIterable {
    case `default`
    case highlighted

    // MARK: - Properties

    var isHighlighted: Bool {
        self == .highlighted
    }
}
