//
//  ButtonGetSizesUseCaseTests.swift
//  SparkComponentButtonTests
//
//  Created by robin.lemaire on 11/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentButton
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("Button Get Sizes Use Case Tests")
struct ButtonGetSizesUseCaseTests {

    // MARK: - Properties

    let sut: ButtonGetSizesUseCase

    // MARK: - Initialization

    init() {
        self.sut = ButtonGetSizesUseCase()
    }

    // MARK: - Tests

    @Test("Size small type button with showAll not loading with styles")
    func sizeSmallTypeButtonShowAllNotLoadingWithStyles() throws {
        // GIVEN / WHEN
        let sizes = self.sut.execute(
            size: .small,
            type: .button,
            contentVisibility: .showAll,
            removeStyles: false,
            isLoading: false
        )

        let expectedSizes = ButtonSizes(height: 32, width: 32, isFixedHeight: true, isFixedWidth: false, maxHeight: nil, imageSize: 16)

        // THEN
        #expect(sizes == expectedSizes)
    }

    @Test("Size small type iconButton with showAll not loading with styles")
    func sizeSmallTypeIconButtonShowAllNotLoadingWithStyles() throws {
        // GIVEN / WHEN
        let sizes = self.sut.execute(
            size: .small,
            type: .iconButton,
            contentVisibility: .showAll,
            removeStyles: false,
            isLoading: false
        )

        let expectedSizes = ButtonSizes(height: 32, width: 32, isFixedHeight: true, isFixedWidth: true, maxHeight: nil, imageSize: 16)

        // THEN
        #expect(sizes == expectedSizes)
    }

    @Test("Size medium type button with showAll not loading with styles")
    func sizeMediumTypeButtonShowAllNotLoadingWithStyles() throws {
        // GIVEN / WHEN
        let sizes = self.sut.execute(
            size: .medium,
            type: .button,
            contentVisibility: .showAll,
            removeStyles: false,
            isLoading: false
        )

        let expectedSizes = ButtonSizes(height: 44, width: 44, isFixedHeight: true, isFixedWidth: false, maxHeight: nil, imageSize: 16)

        // THEN
        #expect(sizes == expectedSizes)
    }

    @Test("Size medium type iconButton with showAll not loading with styles")
    func sizeMediumTypeIconButtonShowAllNotLoadingWithStyles() throws {
        // GIVEN / WHEN
        let sizes = self.sut.execute(
            size: .medium,
            type: .iconButton,
            contentVisibility: .showAll,
            removeStyles: false,
            isLoading: false
        )

        let expectedSizes = ButtonSizes(height: 44, width: 44, isFixedHeight: true, isFixedWidth: true, maxHeight: nil, imageSize: 16)

        // THEN
        #expect(sizes == expectedSizes)
    }

    @Test("Size large type button with showAll not loading with styles")
    func sizeLargeTypeButtonShowAllNotLoadingWithStyles() throws {
        // GIVEN / WHEN
        let sizes = self.sut.execute(
            size: .large,
            type: .button,
            contentVisibility: .showAll,
            removeStyles: false,
            isLoading: false
        )

        let expectedSizes = ButtonSizes(height: 56, width: 56, isFixedHeight: true, isFixedWidth: false, maxHeight: nil, imageSize: 16)

        // THEN
        #expect(sizes == expectedSizes)
    }

    @Test("Size large type iconButton with showAll not loading with styles")
    func sizeLargeTypeIconButtonShowAllNotLoadingWithStyles() throws {
        // GIVEN / WHEN
        let sizes = self.sut.execute(
            size: .large,
            type: .iconButton,
            contentVisibility: .showAll,
            removeStyles: false,
            isLoading: false
        )

        let expectedSizes = ButtonSizes(height: 56, width: 56, isFixedHeight: true, isFixedWidth: true, maxHeight: nil, imageSize: 24)

        // THEN
        #expect(sizes == expectedSizes)
    }

    @Test("Type button with hideLabel not loading has fixed width")
    func typeButtonHideLabelNotLoadingHasFixedWidth() throws {
        // GIVEN / WHEN
        let sizes = self.sut.execute(
            size: .medium,
            type: .button,
            contentVisibility: .hideLabel,
            removeStyles: false,
            isLoading: false
        )

        // THEN
        #expect(sizes.isFixedWidth == true)
    }

    @Test("Type button with hideLabel loading does not have fixed width")
    func typeButtonHideLabelLoadingDoesNotHaveFixedWidth() throws {
        // GIVEN / WHEN
        let sizes = self.sut.execute(
            size: .medium,
            type: .button,
            contentVisibility: .hideLabel,
            removeStyles: false,
            isLoading: true
        )

        // THEN
        #expect(sizes.isFixedWidth == false)
    }

    @Test("Type button with hideImage does not have fixed width")
    func typeButtonHideImageDoesNotHaveFixedWidth() throws {
        // GIVEN / WHEN
        let sizes = self.sut.execute(
            size: .medium,
            type: .button,
            contentVisibility: .hideImage,
            removeStyles: false,
            isLoading: false
        )

        // THEN
        #expect(sizes.isFixedWidth == false)
    }

    @Test("Type iconButton always has fixed width regardless of loading")
    func typeIconButtonAlwaysHasFixedWidth() throws {
        // GIVEN
        let contentVisibilities: [ButtonContentVisibility] = [.showAll, .hideLabel, .hideImage]
        let loadingStates: [Bool] = [true, false]

        for contentVisibility in contentVisibilities {
            for isLoading in loadingStates {
                // WHEN
                let sizes = self.sut.execute(
                    size: .medium,
                    type: .iconButton,
                    contentVisibility: contentVisibility,
                    removeStyles: false,
                    isLoading: isLoading
                )

                // THEN
                #expect(sizes.isFixedWidth == true)
            }
        }
    }

    @Test("Type button with showAll loading does not have fixed width")
    func typeButtonShowAllLoadingDoesNotHaveFixedWidth() throws {
        // GIVEN / WHEN
        let sizes = self.sut.execute(
            size: .medium,
            type: .button,
            contentVisibility: .showAll,
            removeStyles: false,
            isLoading: true
        )

        // THEN
        #expect(sizes.isFixedWidth == false)
    }

    @Test("Remove styles returns no fixed height and infinite max height")
    func removeStylesReturnsNoFixedHeightAndInfiniteMaxHeight() throws {
        // GIVEN / WHEN
        let sizes = self.sut.execute(
            size: .medium,
            type: .button,
            contentVisibility: .showAll,
            removeStyles: true,
            isLoading: false
        )

        // THEN
        #expect(sizes.isFixedHeight == false)
        #expect(sizes.maxHeight == .infinity)
    }

    @Test("With styles returns fixed height and nil max height")
    func withStylesReturnsFixedHeightAndNilMaxHeight() throws {
        // GIVEN / WHEN
        let sizes = self.sut.execute(
            size: .medium,
            type: .button,
            contentVisibility: .showAll,
            removeStyles: false,
            isLoading: false
        )

        // THEN
        #expect(sizes.isFixedHeight == true)
        #expect(sizes.maxHeight == nil)
    }

    @Test("Remove styles ignores size for height calculation")
    func removeStylesIgnoresSizeForHeightCalculation() throws {
        // GIVEN / WHEN
        let sizesSmall = self.sut.execute(
            size: .small,
            type: .button,
            contentVisibility: .showAll,
            removeStyles: true,
            isLoading: false
        )

        let sizesMedium = self.sut.execute(
            size: .medium,
            type: .button,
            contentVisibility: .showAll,
            removeStyles: true,
            isLoading: false
        )

        // THEN
        #expect(sizesSmall.height != sizesMedium.height)
        #expect(sizesSmall.isFixedHeight == false)
        #expect(sizesMedium.isFixedHeight == false)
        #expect(sizesSmall.maxHeight == .infinity)
        #expect(sizesMedium.maxHeight == .infinity)
    }
}
