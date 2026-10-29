//
//  TextLinkGetUnderlineStyleUseCaseTests.swift
//  SparkComponentTextLinkUnitTests
//
//  Created by robin.lemaire on 25/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
import UIKit
@testable import SparkComponentTextLink

@MainActor
@Suite("Text Link Get Underline Style UseCase Tests")
struct TextLinkGetUnderlineStyleUseCaseTests {

    // MARK: - Properties

    private let useCase = TextLinkGetUnderlineStyleUseCase()

    // MARK: - Tests

    @Test("Execute underline variant not highlighted")
    func executeUnderlineVariantNotHighlighted() {
        // GIVEN
        let variant = TextLinkVariant.underline
        let isHighlighted = false

        // WHEN
        let result = self.useCase.execute(
            variant: variant,
            isHighlighted: isHighlighted
        )

        // THEN
        #expect(result == .single)
    }

    @Test("Execute underline variant highlighted")
    func executeUnderlineVariantHighlighted() {
        // GIVEN
        let variant = TextLinkVariant.underline
        let isHighlighted = true

        // WHEN
        let result = self.useCase.execute(
            variant: variant,
            isHighlighted: isHighlighted
        )

        // THEN
        #expect(result == .single)
    }

    @Test("Execute none variant not highlighted")
    func executeNoneVariantNotHighlighted() {
        // GIVEN
        let variant = TextLinkVariant.none
        let isHighlighted = false

        // WHEN
        let result = self.useCase.execute(
            variant: variant,
            isHighlighted: isHighlighted
        )

        // THEN
        #expect(result == nil)
    }

    @Test("Execute none variant highlighted")
    func executeNoneVariantHighlighted() {
        // GIVEN
        let variant = TextLinkVariant.none
        let isHighlighted = true

        // WHEN
        let result = self.useCase.execute(
            variant: variant,
            isHighlighted: isHighlighted
        )

        // THEN
        #expect(result == .single)
    }
}
