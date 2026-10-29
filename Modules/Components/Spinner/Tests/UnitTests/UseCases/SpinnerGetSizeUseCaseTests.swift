//
//  SpinnerGetSizeUseCaseTests.swift
//  SparkComponentSpinnerTests
//
//  Created by Claude on 10.12.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

@testable import SparkComponentSpinner
import Testing

@Suite("Spinner Get Size UseCase Tests")
struct SpinnerGetSizeUseCaseTests {

    // MARK: - Private properties

    private let sut: SpinnerGetSizeUseCase

    // MARK: - Setup

    init() {
        self.sut = SpinnerGetSizeUseCase()
    }

    // MARK: - Tests

    @Test("Execute medium")
    func executeMedium() {
        // GIVEN / WHEN
        let result = self.sut.execute(size: .medium)

        // THEN
        #expect(result == 28)
    }

    @Test("Execute small")
    func executeSmall() {
        // GIVEN / WHEN
        let result = self.sut.execute(size: .small)

        // THEN
        #expect(result == 20)
    }
}
