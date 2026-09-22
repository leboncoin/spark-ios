//
//  ToggleGetShowSpaceUseCase.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 04/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

// sourcery: AutoMockable, AutoMockTest
protocol ToggleGetShowSpaceUseCaseable {
    func execute(isOn: Bool) -> ToggleSpace
}

final class ToggleGetShowSpaceUseCase: ToggleGetShowSpaceUseCaseable {

    // MARK: - Methods

    func execute(isOn: Bool) -> ToggleSpace {
        return isOn ? .left : .right
    }
}
