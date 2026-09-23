//
//  ProgressTrackerIndicatorViewModelTests.swift
//  SparkComponentProgressTrackerSnapshotTests
//
//  Created by Michael Zimmermann on 25.01.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Combine
import XCTest
@testable import SparkComponentProgressTracker
@_spi(SI_SPI) @testable import SparkComponentProgressTrackerTesting
@_spi(SI_SPI) import SparkThemingTesting

final class ProgressTrackerIndicatorViewModelTests: XCTestCase {

    var cancellables = Set<AnyCancellable>()
    var theme: ThemeGeneratedMock!
    var colorsUseCase: ProgressTrackerGetColorsUseCaseableGeneratedMock!

    // MARK: - Setup
    override func setUp() {
        super.setUp()
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
    func test_initialization() {
        // Given
        let sut = self.sut(intent: .alert, variant: .tinted, size: .small, state: .selected)

        // Then
        XCTAssertEqual(sut.state, .selected, "Expected state to be selected")
        XCTAssertEqual(sut.intent, .alert, "Expected intent to be alert")
        XCTAssertEqual(sut.variant, .tinted, "Expected variant to be tinted")
        XCTAssertEqual(sut.size, .small, "Expected size to be small")
        XCTAssertIdentical(sut.theme as? ThemeGeneratedMock, self.theme, "Expected theme to be identical")

        XCTAssertEqual(self.colorsUseCase.executeWithColorsAndIntentAndVariantAndStateCallsCount, 1)
    }

    func test_update_theme() {
        // Given
        let sut = self.sut()
        let expectation = expectation(description: "Expect colors to have been triggered")
        expectation.expectedFulfillmentCount = 2

        sut.$colors.sink { _ in
            expectation.fulfill()
        }
        .store(in: &self.cancellables)

        // When
        sut.theme = self.theme

        // Then
        wait(for: [expectation])
    }

    func test_intent_change() {
        // Given
        let sut = self.sut(intent: .support)
        let expectation = expectation(description: "Expect colors to have been triggered twice")
        expectation.expectedFulfillmentCount = 2

        sut.$colors.sink { _ in
            expectation.fulfill()
        }
        .store(in: &self.cancellables)

        // When
        sut.intent = .danger

        // Then
        wait(for: [expectation])
    }

    func test_intent_no_change() {
        // Given
        let sut = self.sut(intent: .support)
        let expectation = expectation(description: "Expect colors to have been triggered once")
        expectation.expectedFulfillmentCount = 1

        sut.$colors.sink { _ in
            expectation.fulfill()
        }
        .store(in: &self.cancellables)

        // When
        sut.intent = .support

        // Then
        wait(for: [expectation])
    }

    func test_variant_change() {
        // Given
        let sut = self.sut(variant: .outlined)
        let expectation = expectation(description: "Expect colors to have been triggered twice")
        expectation.expectedFulfillmentCount = 2

        sut.$colors.sink { _ in
            expectation.fulfill()
        }
        .store(in: &self.cancellables)

        // When
        sut.variant = .tinted

        // Then
        wait(for: [expectation])
    }

    func test_variant_no_change() {
        // Given
        let sut = self.sut(variant: .outlined)
        let expectation = expectation(description: "Expect colors to have been triggered once")
        expectation.expectedFulfillmentCount = 1

        sut.$colors.sink { _ in
            expectation.fulfill()
        }
        .store(in: &self.cancellables)

        // When
        sut.variant = .outlined

        // Then
        wait(for: [expectation])
    }

    func test_state_change() {
        // Given
        let sut = self.sut(state: .normal)
        let expectation = expectation(description: "Expect colors to have been triggered twice")
        expectation.expectedFulfillmentCount = 2

        sut.$colors.sink { _ in
            expectation.fulfill()
        }
        .store(in: &self.cancellables)

        // When
        sut.state = .pressed

        // Then
        wait(for: [expectation])
    }

    func test_state_no_change() {
        // Given
        let sut = self.sut(state: .pressed)
        let expectation = expectation(description: "Expect colors to have been triggered once")
        expectation.expectedFulfillmentCount = 1

        sut.$colors.sink { _ in
            expectation.fulfill()
        }
        .store(in: &self.cancellables)

        // When
        sut.state = .pressed

        // Then
        wait(for: [expectation])
    }

    func test_selected_changed() {
        // Given
        let sut = self.sut(state: .normal)
        let expectation = expectation(description: "Expect colors to have been triggered twice")
        expectation.expectedFulfillmentCount = 2

        sut.$colors.sink { _ in
            expectation.fulfill()
        }
        .store(in: &self.cancellables)

        // When
        sut.set(selected: true)

        // Then
        wait(for: [expectation])
    }

    func test_enabled_changed() {
        // Given
        let sut = self.sut(state: .normal)
        let expectation = expectation(description: "Expect colors to have been triggered twice")
        expectation.expectedFulfillmentCount = 2

        sut.$colors.sink { _ in
            expectation.fulfill()
        }
        .store(in: &self.cancellables)

        // When
        sut.set(enabled: false)

        // Then
        wait(for: [expectation])
    }

    func test_highlighted_changed() {
        // Given
        let sut = self.sut(state: .normal)
        let expectation = expectation(description: "Expect colors to have been triggered twice")
        expectation.expectedFulfillmentCount = 2

        sut.$colors.sink { _ in
            expectation.fulfill()
        }
        .store(in: &self.cancellables)

        // When
        sut.set(highlighted: true)

        // Then
        wait(for: [expectation])
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
