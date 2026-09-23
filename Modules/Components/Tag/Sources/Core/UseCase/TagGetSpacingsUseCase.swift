//
//  TagGetSpacingsUseCase.swift
//  SparkComponentTag
//
//  Created by robin.lemaire on 05/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming
import SwiftUI

// sourcery: AutoMockable, AutoMockTest
protocol TagGetSpacingsUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme) -> TagSpacings
}

final class TagGetSpacingsUseCase: TagGetSpacingsUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme) -> TagSpacings {
        let spacing = theme.layout.spacing
        return .init(
            horizontalPadding: spacing.medium,
            horizontalSpacing: spacing.small
        )
    }
}
