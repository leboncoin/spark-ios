//
//  RadioButtonGroupViewModelTests.swift
//  SparkComponentRadioButtonTests
//
//  Created by michael.zimmermann on 05.07.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Combine
@testable import SparkComponentRadioButton
@_spi(SI_SPI) @testable import SparkComponentRadioButtonTesting
@_spi(SI_SPI) import SparkThemingTesting
import XCTest

final class RadioButtonGroupViewModelTests: XCTestCase {

    var subscriptions = Set<AnyCancellable>()

    // MARK: - Tests
    func test_expect_all_values_published_on_setup() {
        // Given
        let sut = sut(intent: .support)
        let expectation = expectation(description: "Wait for subscriptions to be published")
        expectation.expectedFulfillmentCount = 1

        let publisher = sut.$spacing

        publisher.sink { _ in
            expectation.fulfill()
        }
        .store(in: &self.subscriptions)

        wait(for: [expectation], timeout: 0.1)
    }

    func test_theme_change() {
        // Given
        let sut = sut(intent: .support)
        let expectation = expectation(description: "Wait for subscriptions to be published")
        expectation.expectedFulfillmentCount = 2

        let publisher = sut.$spacing

        publisher.sink { _ in
            expectation.fulfill()
        }
        .store(in: &self.subscriptions)

        sut.theme = ThemeGeneratedMock.mocked()

        wait(for: [expectation], timeout: 0.1)
    }

    // MARK: - Private helpers
    private func sut(intent: RadioButtonIntent) -> RadioButtonGroupViewModel {
        let useCase = RadioButtonGetGroupColorUseCaseableGeneratedMock()
        useCase.executeWithColorsAndIntentReturnValue = ColorTokenGeneratedMock.random()
        let theme = ThemeGeneratedMock.mocked()

        return .init(
            theme: theme,
            intent: intent,
            useCase: useCase
        )
    }
}
