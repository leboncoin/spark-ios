//
//  ProgressTrackerTrackViewModelTests.swift
//  SparkComponentProgressTrackerUnitTests
//
//  Created by Michael Zimmermann on 06.02.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Combine
import Foundation
import Testing
import UIKit
@testable import SparkComponentProgressTracker
@_spi(SI_SPI) @testable import SparkComponentProgressTrackerTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkThemingTesting

@MainActor
@Suite("ProgressTracker Track ViewModel Tests")
final class ProgressTrackerTrackViewModelTests {

    let colors: ColorsGeneratedMock
    let theme: ThemeGeneratedMock
    let useCase: ProgressTrackerGetTrackColorUseCaseableGeneratedMock
    var cancellables = Set<AnyCancellable>()

    init() {
        self.colors = ColorsGeneratedMock.mocked()
        self.theme = ThemeGeneratedMock.mocked()
        self.useCase = ProgressTrackerGetTrackColorUseCaseableGeneratedMock()

        self.useCase.executeWithColorsAndIntentReturnValue = ColorTokenGeneratedMock.random()
    }

    @Test("Theme updates line color updates")
    func themeUpdatesLineColorUpdates() {
        // GIVEN
        let sut = self.sut()
        var fulfillmentCount = 0

        // WHEN
        sut.theme = ThemeGeneratedMock.mocked()

        sut.$lineColor.subscribe(in: &self.cancellables) { color in
            #expect(self.useCase.executeWithColorsAndIntentReturnValue.uiColor == color.uiColor, "Expected color to have only been set once")
            fulfillmentCount += 1
        }

        // THEN
        #expect(fulfillmentCount == 1, "Expect line color to have been published")
        #expect(self.useCase.executeWithColorsAndIntentCallsCount == 2, "Expected use case to have been executed twice")

        let arguments = self.useCase.executeWithColorsAndIntentReceivedArguments

        #expect(arguments?.colors as? ColorsGeneratedMock !== self.colors, "Expected theme to have changed")
    }

    @Test("Intent updates line color updates")
    func intentUpdatesLineColorUpdates() {
        // GIVEN
        let sut = self.sut(intent: .support)

        // WHEN
        sut.intent = .main

        // THEN
        #expect(self.useCase.executeWithColorsAndIntentCallsCount == 2, "Expected use case to have been called twice")

        let arguments = self.useCase.executeWithColorsAndIntentReceivedArguments

        #expect(arguments?.intent == .main, "Expected argument of use case to be main")
    }

    @Test("Is enabled updates opacity updates")
    func isEnabledUpdatesOpacityUpdates() {
        // GIVEN
        let sut = self.sut(isEnabled: true)

        var fulfillmentCount = 0

        var opacities = [CGFloat]()
        sut.$opacity.subscribe(in: &self.cancellables) { opacity in
            opacities.append(opacity)
            fulfillmentCount += 1
        }

        // WHEN
        sut.isEnabled = false

        #expect(fulfillmentCount == 2, "Expected opacity to have changed")

        // THEN
        #expect(opacities == [1.0, self.theme.dims.dim3])
    }

    @Test("Intent the same no color updates")
    func intentTheSameNoColorUpdates() {
        // GIVEN
        let sut = self.sut(intent: .support)

        // WHEN
        sut.intent = .support

        // THEN
        #expect(self.useCase.executeWithColorsAndIntentCallsCount == 1, "Expected use case to only have been called once")

        let arguments = self.useCase.executeWithColorsAndIntentReceivedArguments

        #expect(arguments?.intent == .support, "Expected argument of use case to be support")
    }

    @Test("Is enabled not updated no line color updates")
    func isEnabledNotUpdatedNoLineColorUpdates() {
        // GIVEN
        let sut = self.sut(isEnabled: true)

        var fulfillmentCount = 0

        sut.$opacity.dropFirst().subscribe(in: &self.cancellables) { opacity in
            fulfillmentCount += 1
        }

        // WHEN
        sut.isEnabled = true

        #expect(fulfillmentCount == 0, "Expected opacity to have changed")
    }

    @Test("Theme produces different line color")
    func themeProducesDifferentLineColor() {

        // GIVEN
        let colors = [UIColor.red, .blue]
        self.useCase.executeWithColorsAndIntentReturnValue = ColorTokenGeneratedMock.init(uiColor: colors[0])
        let sut = self.sut()

        var fulfillmentCount = 0

        // WHEN
        var calls = 0
        sut.$lineColor.subscribe(in: &self.cancellables) { color in
            #expect(color.uiColor == colors[calls], "Expected color to be \(calls == 0 ? "red" : "blue")")
            fulfillmentCount += 1
            calls += 1
        }

        self.useCase.executeWithColorsAndIntentReturnValue = ColorTokenGeneratedMock.init(uiColor: colors[1])
        sut.theme = ThemeGeneratedMock.mocked()

        // THEN
        #expect(fulfillmentCount == 2, "Expect line color to have been published")
    }

    private func sut(
        intent: ProgressTrackerIntent = .support,
        isEnabled: Bool = true) -> ProgressTrackerTrackViewModel {
        return .init(
            theme: self.theme,
            intent: intent,
            isEnabled: isEnabled,
            useCase: self.useCase
        )
    }
}
