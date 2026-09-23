//
//  ChipGetIsReversedUseCase.swift
//  SparkComponentChip
//
//  Created by robin.lemaire on 23/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol ChipGetIsReversedUseCaseable {
    func execute(alignment: ChipAlignment) -> Bool
}

final class ChipGetIsReversedUseCase: ChipGetIsReversedUseCaseable {

    // MARK: - Methods

    func execute(alignment: ChipAlignment) -> Bool {
        return switch alignment {
        case .leadingIcon: true
        case .trailingIcon: false
        }
    }
}
