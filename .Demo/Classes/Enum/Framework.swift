//
//  Framework.swift
//  SparkDemo
//
//  Created by robin.lemaire on 11/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

enum Framework: String, CaseIterable, Hashable {
    case swiftUI
    case uiKit

    // MARK: - Properties

    var isSwiftUI: Bool {
        self == .swiftUI
    }

    var isUIKit: Bool {
        self == .uiKit
    }

    var name: String {
        switch self {
        case .uiKit: "UIKit"
        case .swiftUI: "SwiftUI"
        }
    }

    var icon: String {
        switch self {
        case .uiKit: "u.circle"
        case .swiftUI: "s.circle"
        }
    }
}
