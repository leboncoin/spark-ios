//
//  TagGetTextFontUseCase.swift
//  SparkComponentTag
//
//  Created by robin.lemaire on 05/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SparkTheming
import SwiftUI
import UIKit

// sourcery: AutoMockable, AutoMockTest
protocol TagGetTextFontUseCaseable {
    // sourcery: theme = "Identical", return = "Identical"
    func execute(theme: any Theme) -> any TypographyFontToken
}

final class TagGetTextFontUseCase: TagGetTextFontUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme) -> any TypographyFontToken {
        return theme.typography.captionHighlight
    }
}
