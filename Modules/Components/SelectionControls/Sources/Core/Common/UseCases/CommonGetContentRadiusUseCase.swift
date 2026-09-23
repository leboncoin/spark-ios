//
//  CommonGetContentRadiusUseCase.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 02/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming
import SwiftUI

// sourcery: AutoMockable, AutoMockTest
protocol CommonGetContentRadiusUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme, type: CommonType) -> CGFloat
}

final class CommonGetContentRadiusUseCase: CommonGetContentRadiusUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme, type: CommonType) -> CGFloat {
        switch type {
        case .checkbox: theme.border.radius.small
        case .radioButton, .toggle: theme.border.radius.full
        }
    }
}
