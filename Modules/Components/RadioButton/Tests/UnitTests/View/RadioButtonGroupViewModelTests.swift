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
import Testing

@MainActor
@Suite("RadioButton Group ViewModel Tests")
struct RadioButtonGroupViewModelTests {

    // MARK: - Tests
    @Test("All values should be published on setup")
    func expectAllValuesPublishedOnSetup() async {
        // Given
        let sut = sut(intent: .support)
        var subscriptions = Set<AnyCancellable>()

        await confirmation("Wait for subscriptions to be published", expectedCount: 1) { confirm in
            sut.$spacing.sink { _ in
                confirm()
            }
            .store(in: &subscriptions)
        }
    }

    @Test("Theme change should publish the spacing")
    func themeChange() async {
        // Given
        let sut = sut(intent: .support)
        var subscriptions = Set<AnyCancellable>()

        await confirmation("Wait for subscriptions to be published", expectedCount: 2) { confirm in
            sut.$spacing.sink { _ in
                confirm()
            }
            .store(in: &subscriptions)

            sut.theme = ThemeGeneratedMock.mocked()
        }
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
