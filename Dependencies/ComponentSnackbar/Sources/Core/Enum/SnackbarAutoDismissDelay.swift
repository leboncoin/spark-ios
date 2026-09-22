//
//  SnackbarAutoDismissDelay.swift
//  SparkComponentSnackbar
//
//  Created by louis.borlee on 23/10/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Foundation

/// The auto dismiss delay of the snackbar.
public enum SnackbarAutoDismissDelay: CaseIterable, Equatable {
    case fast
    case long

    // MARK: - Properties

    /// The default value is *fast*
    public static let `default`: Self = .fast

    internal var seconds: Double {
        return switch self {
        case .fast: 4
        case .long: 10
        }
    }
}
