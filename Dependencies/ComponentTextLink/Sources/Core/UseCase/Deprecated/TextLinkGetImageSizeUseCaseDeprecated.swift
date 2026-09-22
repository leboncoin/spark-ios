//
//  TextLinkGetImageSizeUseCaseDeprecated.swift
//  SparkComponentTextLink
//
//  Created by robin.lemaire on 14/12/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable, AutoMockTest
@available(*, deprecated, message: "Not used by the new SparkTextLink or SparkUITextLink")
protocol TextLinkGetImageSizeUseCaseDeprecatedable {
    func execute(typographies: TextLinkTypographies) -> TextLinkImageSize
}

struct TextLinkGetImageSizeUseCaseDeprecated: TextLinkGetImageSizeUseCaseDeprecatedable {

    // MARK: - Methods

    func execute(
        typographies: TextLinkTypographies
    ) -> TextLinkImageSize {
        let lineHeight = typographies.highlight.uiFont.lineHeight
        let pointSize = typographies.highlight.uiFont.pointSize

        return .init(
            size: pointSize,
            padding: (abs(lineHeight - pointSize)) / 2
        )
    }
}
