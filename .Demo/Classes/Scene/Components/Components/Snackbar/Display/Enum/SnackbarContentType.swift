//
//  SnackbarContentType.swift
//  SparkDemo
//
//  Created by robin.lemaire on 29/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

enum SnackbarContentType: String, CaseIterable {
    case empty
    case button
    case custom

    // MARK: - Properties

    static func allCases(for framework: Framework) -> [Self] {
        switch framework {
        case .swiftUI: Self.allCases
        case .uiKit: [.empty, .button]
        }
    }
}
