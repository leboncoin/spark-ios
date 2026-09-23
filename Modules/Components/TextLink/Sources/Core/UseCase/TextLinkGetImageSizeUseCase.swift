//
//  TextLinkGetImageSizeUseCase.swift
//  SparkComponentTextLink
//
//  Created by robin.lemaire on 20/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol TextLinkGetImageSizeUseCaseable {
    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        typography: TextLinkTypography
    ) -> TextLinkImageSize
}

struct TextLinkGetImageSizeUseCase: TextLinkGetImageSizeUseCaseable {

    // MARK: - Properties

    private let typographiesUseCase: any TextLinkGetTypographiesUseCaseable

    // MARK: - Initialization

    init(typographiesUseCase: any TextLinkGetTypographiesUseCaseable = TextLinkGetTypographiesUseCase()) {
        self.typographiesUseCase = typographiesUseCase
    }

    // MARK: - Methods

    func execute(
        theme: any Theme,
        typography: TextLinkTypography
    ) -> TextLinkImageSize {
        let typographies = self.typographiesUseCase.execute(
            theme: theme,
            typography: typography
        )

        let lineHeight = typographies.highlight.uiFont.lineHeight
        let pointSize = typographies.highlight.uiFont.pointSize

        return .init(
            size: pointSize,
            padding: (abs(lineHeight - pointSize)) / 2
        )
    }
}
