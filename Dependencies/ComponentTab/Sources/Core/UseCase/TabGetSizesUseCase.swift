//
//  TabGetSizesUseCase.swift
//  SparkComponentTab
//
//  Created by robin.lemaire on 23/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol TabGetSizesUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme, size: TabSize) -> TabSizes
}

struct TabGetSizesUseCase: TabGetSizesUseCaseable {

    // MARK: - Methods
    func execute(theme: any Theme, size: TabSize) -> TabSizes {
        return switch size {
        case .xSmall: .init(height: 34, iconHeight: 12)
        case .small: .init(height: 36, iconHeight: 14)
        case .medium: .init(height: 40, iconHeight: 16)
        default: .init()
        }
    }
}
