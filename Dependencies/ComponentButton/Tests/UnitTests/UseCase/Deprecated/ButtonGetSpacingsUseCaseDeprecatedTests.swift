//
//  ButtonGetSpacingsUseCaseDeprecatedTests.swift
//  SparkComponentButtonTests
//
//  Created by robin.lemaire on 23/06/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
@testable import SparkComponentButton
@_spi(SI_SPI) import SparkThemingTesting

final class ButtonGetSpacingsUseCaseDeprecatedTests: XCTestCase {

    // MARK: - Tests

    func test_execute() {
        // GIVEN
        let spacingMock = LayoutSpacingGeneratedMock.mocked()

        let useCase = ButtonGetSpacingsUseCaseDeprecated()

        // WHEN
        let layout = useCase.execute(
            spacing: spacingMock
        )

        // THEN
        XCTAssertEqual(layout.horizontalSpacing,
                       spacingMock.large,
                       "Wrong horizontalSpacing value")
        XCTAssertEqual(layout.horizontalPadding,
                       spacingMock.medium,
                       "Wrong horizontalPadding value")
    }
}
