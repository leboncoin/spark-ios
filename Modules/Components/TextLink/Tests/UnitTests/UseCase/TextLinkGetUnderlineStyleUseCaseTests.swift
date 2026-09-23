//
//  TextLinkGetUnderlineStyleUseCaseTests.swift
//  SparkComponentTextLinkUnitTests
//
//  Created by robin.lemaire on 25/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import UIKit
@testable import SparkComponentTextLink

final class TextLinkGetUnderlineStyleUseCaseTests: XCTestCase {

    // MARK: - Properties

    private let useCase = TextLinkGetUnderlineStyleUseCase()

    // MARK: - Tests

    func test_execute_underline_variant_not_highlighted() {
        // GIVEN
        let variant = TextLinkVariant.underline
        let isHighlighted = false

        // WHEN
        let result = self.useCase.execute(
            variant: variant,
            isHighlighted: isHighlighted
        )

        // THEN
        XCTAssertEqual(result, .single)
    }

    func test_execute_underline_variant_highlighted() {
        // GIVEN
        let variant = TextLinkVariant.underline
        let isHighlighted = true

        // WHEN
        let result = self.useCase.execute(
            variant: variant,
            isHighlighted: isHighlighted
        )

        // THEN
        XCTAssertEqual(result, .single)
    }

    func test_execute_none_variant_not_highlighted() {
        // GIVEN
        let variant = TextLinkVariant.none
        let isHighlighted = false

        // WHEN
        let result = self.useCase.execute(
            variant: variant,
            isHighlighted: isHighlighted
        )

        // THEN
        XCTAssertNil(result)
    }

    func test_execute_none_variant_highlighted() {
        // GIVEN
        let variant = TextLinkVariant.none
        let isHighlighted = true

        // WHEN
        let result = self.useCase.execute(
            variant: variant,
            isHighlighted: isHighlighted
        )

        // THEN
        XCTAssertEqual(result, .single)
    }
}
