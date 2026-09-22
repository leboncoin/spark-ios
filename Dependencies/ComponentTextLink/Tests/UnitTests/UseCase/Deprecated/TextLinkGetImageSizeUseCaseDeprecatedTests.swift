//
//  TextLinkGetImageSizeUseCaseDeprecatedTests.swift
//  SparkComponentTextLinkUnitTests
//
//  Created by robin.lemaire on 14/12/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
@testable import SparkComponentTextLink

final class TextLinkGetImageSizeUseCaseDeprecatedTests: XCTestCase {

    // MARK: - Tests

    func test_execute() {
        // GIVEN
        let typograhiesMock = TextLinkTypographies.mocked()
        let highlighFontMock = typograhiesMock.highlight.uiFont

        let useCase = TextLinkGetImageSizeUseCaseDeprecated()

        // WHEN
        let imageSize = useCase.execute(typographies: typograhiesMock)

        // THEN
        XCTAssertEqual(
            imageSize.size,
            highlighFontMock.pointSize,
            "Wrong size"
        )
        XCTAssertEqual(
            imageSize.padding,
            (abs(highlighFontMock.lineHeight - highlighFontMock.pointSize)) / 2,
            "Wrong padding"
        )
    }
}
