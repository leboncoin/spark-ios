//
//  SnackbarGetIntentsUseCase.swift
//  SparkComponentSnackbar
//
//  Created by robin.lemaire on 13/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkComponentButton

// sourcery: AutoMockable, AutoMockTest
protocol SnackbarGetIntentsUseCaseable {
    func execute(intent: SnackbarIntent) -> SnackbarIntents
}

struct SnackbarGetIntentsUseCase: SnackbarGetIntentsUseCaseable {

    // MARK: - Methods

    func execute(intent: SnackbarIntent) -> SnackbarIntents {
        let buttonIntent: ButtonIntent = switch intent {
        case .alert: .alert
        case .error: .danger
        case .info: .info
        case .success: .success
        case .accent, .main, .neutral, .support, .surfaceInverse:
            // Deprecated cases - fallback to info
            .info
        }

        return SnackbarIntents(button: buttonIntent)
    }
}
