//
//  DashState.swift
//  SparkCommon
//
//  Created by robin.lemaire on 26/092025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

enum DashState: String, Hashable, CaseIterable {
    case `default`
    case dashed

    // MARK: - Properties

    var dash: CGFloat? {
        self == .dashed ? 8 : nil
    }
}
