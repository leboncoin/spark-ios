//
//  TextLinkGetTypographiesUseCaseDeprecatedTests.swift
//  SparkComponentTextLinkUnitTests
//
//  Created by robin.lemaire on 06/12/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
@testable import SparkComponentTextLink
@_spi(SI_SPI) import SparkThemingTesting

final class TextLinkGetTypographiesUseCaseDeprecatedTests: XCTestCase {

    // MARK: - Tests

    func test_execute_for_all_intents() {
        // GIVEN
        let useCase = TextLinkGetTypographiesUseCaseDeprecated()
        let typographyMock = TypographyGeneratedMock.mocked()

        let givenTypographies = TextLinkTypography.allCases

        // WHEN
        for givenTypography in givenTypographies {
            let typographies = useCase.execute(
                textLinkTypography: givenTypography,
                typography: typographyMock
            )

            let expectedTypographies = givenTypography.expectedTypographies(
                from: typographyMock
            )

            // THEN
            XCTAssertEqual(
                typographies,
                expectedTypographies,
                "Wrong typographies for .\(givenTypography) case"
            )
        }
    }
}

// MARK: - Extension

private extension TextLinkTypography {

    func expectedTypographies(from typographyMock: TypographyGeneratedMock) -> TextLinkTypographies {
        return switch self {
        case .display1: .init(
            normal: typographyMock.display1,
            highlight: typographyMock.display1
        )
        case .display2: .init(
            normal: typographyMock.display2,
            highlight: typographyMock.display2
        )
        case .display3: .init(
            normal: typographyMock.display3,
            highlight: typographyMock.display3
        )

        case .headline1: .init(
            normal: typographyMock.headline1,
            highlight: typographyMock.headline1
        )
        case .headline2: .init(
            normal: typographyMock.headline2,
            highlight: typographyMock.headline2
        )

        case .subhead: .init(
            normal: typographyMock.subhead,
            highlight: typographyMock.subhead
        )

        case .body1: .init(
            normal: typographyMock.body1,
            highlight: typographyMock.body1Highlight
        )
        case .body2: .init(
            normal: typographyMock.body2,
            highlight: typographyMock.body2Highlight
        )

        case .caption: .init(
            normal: typographyMock.caption,
            highlight: typographyMock.captionHighlight
        )

        case .small: .init(
            normal: typographyMock.small,
            highlight: typographyMock.smallHighlight
        )

        case .callout: .init(
            normal: typographyMock.callout,
            highlight: typographyMock.callout
        )
        }
    }
}
