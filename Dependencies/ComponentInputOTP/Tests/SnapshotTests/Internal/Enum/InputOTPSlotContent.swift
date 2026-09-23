//
//  InputOTPSlotContent.swift
//  SparkComponentInputOTPSnapshotTests
//
//  Created by robin.lemaire on 04/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

enum InputOTPSlotContent: String, CaseIterable {
    case empty
    case setted

    // MARK: - Properties

    static let `default`: InputOTPSlotContent = .setted

    var valueMocked: String {
        return switch self {
        case .empty: ""
        case .setted: "2"
        }
    }
}
