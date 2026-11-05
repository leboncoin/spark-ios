//
//  ProgressTrackerViewModelTests.swift
//  SparkComponentProgressTrackerUnitTests
//
//  Created by Michael Zimmermann on 24.01.24.
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
@Suite("ProgressTracker ViewModel Tests")
final class ProgressTrackerViewModelTests {

    // MARK: Properties
    let theme: ThemeGeneratedMock
    let spacingsUseCase: ProgressTrackerGetSpacingsUseCaseableGeneratedMock
    var cancellables = Set<AnyCancellable>()

    // MARK: - Initialization
    init() {
        self.theme = ThemeGeneratedMock.mocked()
        self.spacingsUseCase = ProgressTrackerGetSpacingsUseCaseableGeneratedMock()
        self.spacingsUseCase.executeWithSpacingAndOrientationReturnValue = .stub()
    }

    // MARK: - Tests
    @Test("Vertical setup")
    func verticalSetup() {
        // GIVEN
        let _ = self.sut(orientation: .vertical)

        // THEN
        #expect(self.spacingsUseCase.executeWithSpacingAndOrientationCallsCount == 1, "Use case expected to have been called")

        let spacingsParameters = self.spacingsUseCase.executeWithSpacingAndOrientationReceivedArguments

        #expect(spacingsParameters?.orientation == .vertical, "Orientation expected to have been vertical")
    }

    @Test("Horizontal setup")
    func horizontalSetup() {
        // GIVEN
        let _ = self.sut(orientation: .horizontal)

        // THEN
        #expect(self.spacingsUseCase.executeWithSpacingAndOrientationCallsCount == 1, "Spacings use case expected to have been called")

        let spacingsParameters = self.spacingsUseCase.executeWithSpacingAndOrientationReceivedArguments

        #expect(spacingsParameters?.orientation == .horizontal, "Orientation expected to be have been horizontal")
    }

    @Test("Theme changed")
    func themeChanged() {
        // GIVEN
        let sut = self.sut(orientation: .horizontal)
        var fulfillmentCount = 0

        Publishers.Zip(sut.$spacings, sut.$font)
            .sink { _ in
            fulfillmentCount += 1
        }
        .store(in: &self.cancellables)

        // WHEN
        sut.theme = ThemeGeneratedMock.mocked()

        // THEN
        #expect(fulfillmentCount == 2, "Wait for spacing & font change")
    }

    @Test("Orientation is changed spacings updated")
    func orientationIsChangedSpacingsUpdated() {
        // GIVEN
        let sut = self.sut(orientation: . vertical)
        var fulfillmentCount = 0

        sut.$spacings.sink { _ in
            fulfillmentCount += 1
        }
        .store(in: &self.cancellables)

        // WHEN
        sut.orientation = .horizontal

        // THEN
        #expect(fulfillmentCount == 2, "Wait for spacings to be change")
        let arguments = self.spacingsUseCase.executeWithSpacingAndOrientationReceivedArguments
        #expect(arguments?.spacing as? LayoutSpacingGeneratedMock === self.theme.layout.spacing as? LayoutSpacingGeneratedMock)
        #expect(arguments?.orientation == .horizontal)
        #expect(self.spacingsUseCase.executeWithSpacingAndOrientationCallsCount == 2)
    }

    @Test("Orientation is not changed spacings is not updated")
    func orientationIsNotChangedSpacingsIsNotUpdated() {
        // GIVEN
        let sut = self.sut(orientation: . vertical)

        // WHEN
        sut.orientation = .vertical

        // THEN
        #expect(self.spacingsUseCase.executeWithSpacingAndOrientationCallsCount == 1)

    }

    @Test("Change show default page number")
    func changeShowDefaultPageNumber() {
        // GIVEN
        let sut = sut(orientation: .vertical, showDefaultPageNumber: false)

        #expect(!sut.content.showDefaultPageNumber, "Expected show default page number of content to be false")
        #expect(!sut.showDefaultPageNumber, "Expected show default page number to be false")

        // WHEN
        sut.showDefaultPageNumber = true

        // THEN
        #expect(sut.content.showDefaultPageNumber, "Expected show default page number of content to be true")
        #expect(sut.showDefaultPageNumber, "Expected show default page number to be true")
    }

    @Test("Change number of pages")
    func changeNumberOfPages() {
        // GIVEN
        let sut = sut(orientation: .vertical, numberOfPages: 2)

        #expect(sut.content.numberOfPages == 2, "Expected number of pages of content to be 2")
        #expect(sut.numberOfPages == 2, "Expected number of pages to be 2")

        // WHEN
        sut.numberOfPages = 6

        // THEN
        #expect(sut.content.numberOfPages == 6, "Expected number of pages of content to be 6")
        #expect(sut.numberOfPages == 6, "Expected number of pages to be 6")
    }

    @Test("Change current page index")
    func changeCurrentPageIndex() {
        // GIVEN
        let sut = sut(orientation: .vertical, numberOfPages: 4)
        let allGivenExpected: [(given: Int, expected: Int)] = [(-1, 0), (0, 0), (3, 3), (4, 3) ]

        for givenExpected in allGivenExpected {
            // WHEN
            sut.currentPageIndex = givenExpected.given

            // THEN
            #expect(sut.currentPageIndex == givenExpected.expected, "Expected current page index when set to \(givenExpected.given) to be \(givenExpected.expected)")
        }
    }

    @Test("Set disabled")
    func setDisabled() {
        // GIVEN
        let sut = sut(orientation: .vertical, numberOfPages: 4)

        for i in 0..<4 {
            #expect(sut.labelOpacity(forIndex: i) == 1.0, "Expected opacity of label at \(i) to be 1.0")
        }

        // WHEN
        sut.setIsEnabled(false)

        // THEN
        #expect(sut.disabledIndices.count == 4, "Expected all indices to be disabled")

        for i in 0..<4 {
            #expect(sut.labelOpacity(forIndex: i) == self.theme.dims.dim1, "Expected opacity of label at \(i) to be dim3")
        }
    }

    @Test("Set enabled single item")
    func setEnabledSingleItem() {
        // GIVEN
        let sut = sut(orientation: .vertical, numberOfPages: 4)

        // WHEN
        sut.setIsEnabled(false)
        sut.setIsEnabled(isEnabled: true, forIndex: 0)

        // THEN
        #expect(sut.disabledIndices == Set(arrayLiteral: 1, 2, 3))
    }

    @Test("Set disabled single item")
    func setDisabledSingleItem() {
        // GIVEN
        let sut = sut(orientation: .vertical, numberOfPages: 4)

        // WHEN
        sut.setIsEnabled(isEnabled: false, forIndex: 0)

        // THEN
        #expect(sut.disabledIndices == Set(arrayLiteral: 0))
    }

    @Test("Set enabled after disabled")
    func setEnabledAfterDisabled() {
        // GIVEN
        let sut = sut(orientation: .vertical, numberOfPages: 4)

        // WHEN
        sut.setIsEnabled(false)
        sut.setIsEnabled(true)

        // THEN
        #expect(sut.disabledIndices.isEmpty)
    }

    @Test("Enabled color")
    func enabledColor() {
        // GIVEN
        let sut = sut(orientation: .vertical, numberOfPages: 4)

        // THEN
        #expect(sut.disabledIndices.isEmpty)
    }

    @Test("Disabled opacity published")
    func disabledOpacityPublished() {
        // GIVEN
        let sut = sut(orientation: .vertical, numberOfPages: 4)

        var fulfillmentCount = 0

        var publishedCount = 0

        sut.$disabledIndices.subscribe(in: &self.cancellables) { disabledIndices in
            if publishedCount == 1 {
                #expect(disabledIndices == Set([0]))
            }
            publishedCount += 1
            fulfillmentCount += 1
        }

        // WHEN
        sut.setIsEnabled(isEnabled: false, forIndex: 0)

        // THEN
        #expect(fulfillmentCount == 2, "disabled index should be published")
    }

    // MARK: - Private helper functions
    private func sut(
        orientation: ProgressTrackerOrientation,
        numberOfPages: Int = 4,
        showDefaultPageNumber: Bool = true
    ) -> ProgressTrackerViewModel<ProgressTrackerUIIndicatorContent> {
        let content = ProgressTrackerContent<ProgressTrackerUIIndicatorContent>(
            numberOfPages: numberOfPages,
            currentPageIndex: 0,
            showDefaultPageNumber: showDefaultPageNumber)
        return ProgressTrackerViewModel<ProgressTrackerUIIndicatorContent>(
            theme: self.theme,
            orientation: orientation,
            content: content,
            spacingUseCase: self.spacingsUseCase
        )
    }
}

private extension ProgressTrackerSpacing {
    static func stub() -> ProgressTrackerSpacing {
        return ProgressTrackerSpacing(trackIndicatorSpacing: 1.0, minLabelSpacing: 2.0)
    }
}
