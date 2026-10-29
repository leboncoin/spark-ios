//
//  ProgressTrackerIndicatorViewModelTests.swift
//  SparkComponentProgressTrackerSnapshotTests
//
//  Created by Michael Zimmermann on 25.01.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Combine
import Foundation
import Testing
import UIKit
@testable import SparkComponentProgressTracker
@_spi(SI_SPI) @testable import SparkComponentProgressTrackerTesting
@_spi(SI_SPI) import SparkThemingTesting

@MainActor
@Suite("ProgressTracker Indicator ViewModel Tests")
final class ProgressTrackerIndicatorViewModelTests {

    var cancellables = Set<AnyCancellable>()
    let theme: ThemeGeneratedMock
    let colorsUseCase: ProgressTrackerGetColorsUseCaseableGeneratedMock

    // MARK: - Initialization
    init() {
        self.theme = ThemeGeneratedMock.mocked()
        self.colorsUseCase = ProgressTrackerGetColorsUseCaseableGeneratedMock()

        self.colorsUseCase
            .executeWithColorsAndIntentAndVariantAndStateReturnValue = .init(
                background: self.theme.colors.support.supportContainer,
                outline: self.theme.colors.support.onSupport,
                content: self.theme.colors.support.support
            )
    }

    // MARK: - Tests
    @Test("Initialization")
    func initialization() {
        // Given
        let sut = self.sut(intent: .alert, variant: .tinted, size: .small, state: .selected)

        // Then
        #expect(sut.state == .selected, "Expected state to be selected")
        #expect(sut.intent == .alert, "Expected intent to be alert")
        #expect(sut.variant == .tinted, "Expected variant to be tinted")
        #expect(sut.size == .small, "Expected size to be small")
        #expect(sut.theme as? ThemeGeneratedMock === self.theme, "Expected theme to be identical")

        #expect(self.colorsUseCase.executeWithColorsAndIntentAndVariantAndStateCallsCount == 1)
    }

    @Test("Update theme")
    func updateTheme() {
        // Given
        let sut = self.sut()
        var fulfillmentCount = 0

        sut.$colors.sink { _ in
            fulfillmentCount += 1
        }
        .store(in: &self.cancellables)

        // When
        sut.theme = self.theme

        // Then
        #expect(fulfillmentCount == 2, "Expect colors to have been triggered")
    }

    @Test("Intent change")
    func intentChange() {
        // Given
        let sut = self.sut(intent: .support)
        var fulfillmentCount = 0

        sut.$colors.sink { _ in
            fulfillmentCount += 1
        }
        .store(in: &self.cancellables)

        // When
        sut.intent = .danger

        // Then
        #expect(fulfillmentCount == 2, "Expect colors to have been triggered twice")
    }

    @Test("Intent no change")
    func intentNoChange() {
        // Given
        let sut = self.sut(intent: .support)
        var fulfillmentCount = 0

        sut.$colors.sink { _ in
            fulfillmentCount += 1
        }
        .store(in: &self.cancellables)

        // When
        sut.intent = .support

        // Then
        #expect(fulfillmentCount == 1, "Expect colors to have been triggered once")
    }

    @Test("Variant change")
    func variantChange() {
        // Given
        let sut = self.sut(variant: .outlined)
        var fulfillmentCount = 0

        sut.$colors.sink { _ in
            fulfillmentCount += 1
        }
        .store(in: &self.cancellables)

        // When
        sut.variant = .tinted

        // Then
        #expect(fulfillmentCount == 2, "Expect colors to have been triggered twice")
    }

    @Test("Variant no change")
    func variantNoChange() {
        // Given
        let sut = self.sut(variant: .outlined)
        var fulfillmentCount = 0

        sut.$colors.sink { _ in
            fulfillmentCount += 1
        }
        .store(in: &self.cancellables)

        // When
        sut.variant = .outlined

        // Then
        #expect(fulfillmentCount == 1, "Expect colors to have been triggered once")
    }

    @Test("State change")
    func stateChange() {
        // Given
        let sut = self.sut(state: .normal)
        var fulfillmentCount = 0

        sut.$colors.sink { _ in
            fulfillmentCount += 1
        }
        .store(in: &self.cancellables)

        // When
        sut.state = .pressed

        // Then
        #expect(fulfillmentCount == 2, "Expect colors to have been triggered twice")
    }

    @Test("State no change")
    func stateNoChange() {
        // Given
        let sut = self.sut(state: .pressed)
        var fulfillmentCount = 0

        sut.$colors.sink { _ in
            fulfillmentCount += 1
        }
        .store(in: &self.cancellables)

        // When
        sut.state = .pressed

        // Then
        #expect(fulfillmentCount == 1, "Expect colors to have been triggered once")
    }

    @Test("Selected changed")
    func selectedChanged() {
        // Given
        let sut = self.sut(state: .normal)
        var fulfillmentCount = 0

        sut.$colors.sink { _ in
            fulfillmentCount += 1
        }
        .store(in: &self.cancellables)

        // When
        sut.set(selected: true)

        // Then
        #expect(fulfillmentCount == 2, "Expect colors to have been triggered twice")
    }

    @Test("Enabled changed")
    func enabledChanged() {
        // Given
        let sut = self.sut(state: .normal)
        var fulfillmentCount = 0

        sut.$colors.sink { _ in
            fulfillmentCount += 1
        }
        .store(in: &self.cancellables)

        // When
        sut.set(enabled: false)

        // Then
        #expect(fulfillmentCount == 2, "Expect colors to have been triggered twice")
    }

    @Test("Highlighted changed")
    func highlightedChanged() {
        // Given
        let sut = self.sut(state: .normal)
        var fulfillmentCount = 0

        sut.$colors.sink { _ in
            fulfillmentCount += 1
        }
        .store(in: &self.cancellables)

        // When
        sut.set(highlighted: true)

        // Then
        #expect(fulfillmentCount == 2, "Expect colors to have been triggered twice")
    }

    // MARK: Private functions
    private func sut(
        intent: ProgressTrackerIntent = .support,
        variant: ProgressTrackerVariant = .outlined,
        size: ProgressTrackerSize = .large,
        state: ProgressTrackerState = .normal) -> ProgressTrackerIndicatorViewModel<ProgressTrackerUIIndicatorContent> {
            return .init(
                theme: self.theme,
                intent: intent,
                variant: variant,
                size: size,
                content: ProgressTrackerUIIndicatorContent(),
                state: state,
                colorsUseCase: self.colorsUseCase
            )
        }

}
