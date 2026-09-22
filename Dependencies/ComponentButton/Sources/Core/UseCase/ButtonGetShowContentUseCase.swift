//
//  ButtonGetShowContentUseCase.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 13/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol ButtonGetShowContentUseCaseable {
    func execute(
        type: ButtonType,
        contentVisibility: ButtonContentVisibility,
        isLoading: Bool
    ) -> Bool
}

struct ButtonGetShowContentUseCase: ButtonGetShowContentUseCaseable {

    // MARK: - Methods

    func execute(
        type: ButtonType,
        contentVisibility: ButtonContentVisibility,
        isLoading: Bool
    ) -> Bool {
        return !(isLoading && (type == .iconButton || contentVisibility == .hideLabel))
    }
}
