//
//  TabGetFontsUseCase.swift
//  SparkComponentTab
//
//  Created by robin.lemaire on 23/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol TabGetFontsUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme, size: TabSize, isSelected: Bool) -> TabFonts
}

struct TabGetFontsUseCase: TabGetFontsUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme, size: TabSize, isSelected: Bool) -> TabFonts {
        let typography = theme.typography

        let typographyFontToken: any TypographyFontToken = switch size {
        case .xSmall:
            isSelected ? typography.captionHighlight : typography.caption
        case .small:
            isSelected ? typography.body2Highlight : typography.body2
        case .medium:
            isSelected ? typography.body1Highlight : typography.body1
        default:
            isSelected ? typography.body1Highlight : typography.body1
        }

        return TabFonts(typographyFontToken: typographyFontToken)
    }
}
