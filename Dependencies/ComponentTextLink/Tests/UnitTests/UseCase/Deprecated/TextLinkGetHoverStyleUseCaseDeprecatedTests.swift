//
//  TextLinkGetHoverStyleUseCaseDeprecatedTests.swift
//  SparkComponentTextLinkUnitTests
//
//  Created by robin.lemaire on 22/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
@testable import SparkComponentTextLink
@_spi(SI_SPI)  import SparkComponentTextLinkTesting
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

final class TextLinkGetHoverStyleUseCaseDeprecatedTests: XCTestCase {

    // MARK: - Tests

    func test_execute_for_all_intents() {
        // GIVEN
        let useCase = TextLinkGetHoverStyleUseCaseDeprecated()
        let themeMock = ThemeGeneratedMock.mocked()

        let givenIntents = TextLinkTestingIntent.allCases

        // WHEN
        for givenIntent in givenIntents {
            let givenIntent = givenIntent.toType(themeMock)

            let hoverStyle = useCase.execute(
                theme: themeMock,
                intent: givenIntent
            )

            let expectedHoverStyle = givenIntent.expectedHoverStyle(
                from: themeMock
            )

            // THEN
            XCTAssertEqual(
                hoverStyle,
                expectedHoverStyle,
                "Wrong hover style for .\(givenIntent) case"
            )
        }
    }
}

// MARK: - Extension

private extension TextLinkIntent {

    func expectedHoverStyle(from themeMock: ThemeGeneratedMock) -> TextLinkHoverStyle {
        let backgroundColor = switch self {
        case .accent, .accentContainer, .onAccentContainer: themeMock.colors.accent.accent
        case .alert, .alertContainer: themeMock.colors.feedback.alert
        case .danger, .dangerContainer: themeMock.colors.feedback.error
        case .info, .infoContainer: themeMock.colors.feedback.info
        case .main, .mainContainer: themeMock.colors.main.main
        case .neutral, .neutralContainer: themeMock.colors.feedback.neutral
        case .surface, .onSurface: themeMock.colors.base.surface
        case .success, .successContainer: themeMock.colors.feedback.success
        case .support, .supportContainer: themeMock.colors.support.support
        case .custom: themeMock.colors.accent.accentContainer
        }

        return TextLinkHoverStyle(
            horizontalPadding: themeMock.layout.spacing.medium,
            verticalPadding: themeMock.layout.spacing.small,
            cornerRadius: themeMock.border.radius.medium,
            backgroundColor: backgroundColor,
            dim: themeMock.dims.dim5
        )
    }
}
