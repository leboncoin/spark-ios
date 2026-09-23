//
//  TextLinkGetDimUseCaseDeprecatedTests.swift
//  SparkComponentTextLinkUnitTests
//
//  Created by robin.lemaire on 03/06/2025.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
@testable import SparkComponentTextLink
@_spi(SI_SPI)  import SparkComponentTextLinkTesting
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

final class TextLinkGetDimUseCaseDeprecatedTests: XCTestCase {

    // MARK: - Properties

    private let themeMock = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    func test_execute_for_all_intents_when_isHighlighted_is_false() {
        // GIVEN
        let useCase = TextLinkGetDimUseCaseDeprecated()

        let givenIntents = TextLinkTestingIntent.allCases

        // WHEN
        for givenIntent in givenIntents {
            let givenIntent = givenIntent.toType(themeMock)

            let dim = useCase.execute(
                intent: givenIntent,
                isHighlighted: false,
                dims: self.themeMock.dims
            )

            let expectedDim = givenIntent.expectedDimWithoutHighlighted(
                from: self.themeMock
            )

            // THEN
            XCTAssertEqual(
                dim,
                expectedDim,
                "Wrong dim for .\(givenIntent) case"
            )
        }
    }

    func test_execute_for_all_intents_when_isHighlighted_is_true() {
        // GIVEN
        let useCase = TextLinkGetDimUseCaseDeprecated()

        let givenIntents = TextLinkTestingIntent.allCases

        // WHEN
        for givenIntent in givenIntents {
            let givenIntent = givenIntent.toType(self.themeMock)

            let dim = useCase.execute(
                intent: givenIntent,
                isHighlighted: true,
                dims: self.themeMock.dims
            )

            let expectedDim = givenIntent.expectedDimWithHighlighted(
                from: self.themeMock
            )

            // THEN
            XCTAssertEqual(
                dim,
                expectedDim,
                "Wrong dim for .\(givenIntent) case"
            )
        }
    }
}

// MARK: - Extension

private extension TextLinkIntent {

    func expectedDimWithHighlighted(from themeMock: ThemeGeneratedMock) -> CGFloat {
        let dimsMock = themeMock.dims

        return switch self {
        case .accent: dimsMock.none
        case .accentContainer: dimsMock.dim1
        case .onAccentContainer: dimsMock.dim1
        case .alert: dimsMock.none
        case .alertContainer: dimsMock.dim1
        case .danger: dimsMock.none
        case .dangerContainer: dimsMock.dim1
        case .info: dimsMock.none
        case .infoContainer: dimsMock.dim1
        case .main: dimsMock.none
        case .mainContainer: dimsMock.dim1
        case .neutral: dimsMock.none
        case .neutralContainer: dimsMock.dim1
        case .surface: dimsMock.none
        case .onSurface: dimsMock.none
        case .success: dimsMock.none
        case .successContainer: dimsMock.dim1
        case .support: dimsMock.none
        case .supportContainer: dimsMock.dim1
        case .custom: dimsMock.none
        }
    }

    func expectedDimWithoutHighlighted(from themeMock: ThemeGeneratedMock) -> CGFloat {
        return themeMock.dims.none
    }
}
