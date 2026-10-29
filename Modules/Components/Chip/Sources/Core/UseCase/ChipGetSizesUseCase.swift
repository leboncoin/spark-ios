//
//  ChipGetSizesUseCase.swift
//  SparkComponentChip
//
//  Created by robin.lemaire on 09/09/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol ChipGetSizesUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme, size: ChipSize) -> ChipSizes
}

final class ChipGetSizesUseCase: ChipGetSizesUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme, size: ChipSize) -> ChipSizes {
        let token = ChipToken.Size()

        return ChipSizes(
            height: token.height(for: size),
            iconSize: token.icon
        )
    }
}
