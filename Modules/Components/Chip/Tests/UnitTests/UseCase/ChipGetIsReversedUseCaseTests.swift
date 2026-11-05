//
//  ChipGetIsReversedUseCaseTests.swift
//  SparkComponentChipTests
//
//  Created by robin.lemaire on 25/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentChip

@Suite("Chip Get Is Reversed UseCase Tests")
struct ChipGetIsReversedUseCaseTests {

    // MARK: - Properties

    private let sut: ChipGetIsReversedUseCase

    // MARK: - Initialization

    init() {
        self.sut = ChipGetIsReversedUseCase()
    }

    // MARK: - Tests

    @Test("Execute with leading icon alignment")
    func executeWithLeadingIconAlignment() {
        // GIVEN / WHEN
        let result = self.sut.execute(alignment: .leadingIcon)

        // THEN
        #expect(result)
    }

    @Test("Execute with trailing icon alignment")
    func executeWithTrailingIconAlignment() {
        // GIVEN / WHEN
        let result = self.sut.execute(alignment: .trailingIcon)

        // THEN
        #expect(!result)
    }
}
