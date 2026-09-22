//
//  TextLinkGetUnderlineUseCaseDeprecatedTests.swift
//  SparkComponentTextLinkUnitTests
//
//  Created by robin.lemaire on 06/12/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
@testable import SparkComponentTextLink

final class TextLinkGetUnderlineUseCaseDeprecatedTests: XCTestCase {

    // MARK: - Tests

    func test_execute_for_all_intents_and_isHighlighted_at_true() {
        // GIVEN
        let useCase = TextLinkGetUnderlineUseCaseDeprecated()

        let textLinkVariants = TextLinkVariant.allCases

        // WHEN
        for textLinkVariant in textLinkVariants {
            let underline = useCase.execute(
                variant: textLinkVariant,
                isHighlighted: true
            )

            // THEN
            XCTAssertEqual(
                underline,
                .single,
                "Wrong underline for .\(textLinkVariant) case"
            )
        }
    }

    func test_execute_for_all_intents_and_isHighlighted_at_false() {
        // GIVEN
        let useCase = TextLinkGetUnderlineUseCaseDeprecated()

        let textLinkVariants = TextLinkVariant.allCases

        // WHEN
        for textLinkVariant in textLinkVariants {
            let underline = useCase.execute(
                variant: textLinkVariant,
                isHighlighted: false
            )

            // THEN
            XCTAssertEqual(
                underline,
                textLinkVariant.expectedUnderlineStyle,
                "Wrong underline for .\(textLinkVariant) case"
            )
        }
    }
}

// MARK: - Extension

private extension TextLinkVariant {

    var expectedUnderlineStyle: NSUnderlineStyle? {
        switch self {
        case .underline:
            return .single
        case .none:
            return nil
        }
    }
}
