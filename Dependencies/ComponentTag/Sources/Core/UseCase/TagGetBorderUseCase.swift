//
//  TagGetBorderUseCase.swift
//  SparkComponentTag
//
//  Created by robin.lemaire on 05/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkCommon
import SparkTheming
import SwiftUI

// sourcery: AutoMockable, AutoMockTest
protocol TagGetBorderUseCaseable {
    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        size: TagSize
    ) -> TagBorder
}

final class TagGetBorderUseCase: TagGetBorderUseCaseable {

    // MARK: - Methods

    func execute(
        theme: any Theme,
        size: TagSize
    ) -> TagBorder {
        let border = theme.border

        return .init(
            width: border.width.small,
            radius: border.radius.small
        )
    }
}
