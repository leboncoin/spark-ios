//
//  SliderViewModelWithMocksTests.swift
//  SparkComponentSliderUnitTests
//
//  Created by louis.borlee on 03/01/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import XCTest
import Combine
@testable import SparkComponentSlider
@_spi(SI_SPI) @testable import SparkComponentSliderTesting
@_spi(SI_SPI) import SparkCommonTesting
@_spi(SI_SPI) import SparkThemingTesting

class SliderViewModelDeprecatedWithMocksTests: XCTestCase {
    let intent = SliderIntent.info
    let shape = SliderShape.rounded
    let expectedRadii = SliderRadiiDeprecated.mocked()

    var theme: ThemeGeneratedMock!
    var viewModel: SliderViewModelDeprecated<Float>!
    var expectedColors: SliderColorsDeprecated!
    var getColorsUseCase: SliderGetColorsUseCasableDeprecatedGeneratedMock!
    var getCornerRadiiUseCase: SliderGetCornerRadiiUseCasableDeprecatedGeneratedMock!
    var getStepValuesInBoundsUseCase: SliderGetStepValuesInBoundsUseCasableDeprecatedMock<Float>!
    var getClosestValueUseCase: SliderGetClosestValueUseCasableDeprecatedMock<Float>!

    var publishers: SliderPublishers!

    func setupPublishers() {
        self.publishers = SliderPublishers(
            dim: PublisherMock(publisher: self.viewModel.$dim),
            trackColor: PublisherMock(publisher: self.viewModel.$trackColor),
            handleColor: PublisherMock(publisher: self.viewModel.$handleColor),
            indicatorColor: PublisherMock(publisher: self.viewModel.$indicatorColor),
            handleActiveIndicatorColor: PublisherMock(publisher: self.viewModel.$handleActiveIndicatorColor),
            trackRadius: PublisherMock(publisher: self.viewModel.$trackRadius),
            indicatorRadius: PublisherMock(publisher: self.viewModel.$indicatorRadius)
        )
        self.publishers.load()
    }

    func resetUseCases() {
        self.getColorsUseCase.reset()
        self.getCornerRadiiUseCase.reset()
        self.getClosestValueUseCase.reset()
        self.getStepValuesInBoundsUseCase.reset()
    }

    override func setUp() {
        super.setUp()
        self.theme = ThemeGeneratedMock.mocked()
        self.expectedColors = SliderColorsDeprecated.mocked(colors: self.theme.colors)
        self.getColorsUseCase = SliderGetColorsUseCasableDeprecatedGeneratedMock.mocked(returnedColors: self.expectedColors)
        self.getCornerRadiiUseCase = SliderGetCornerRadiiUseCasableDeprecatedGeneratedMock.mocked(expectedRadii: self.expectedRadii)
        self.getStepValuesInBoundsUseCase = SliderGetStepValuesInBoundsUseCasableDeprecatedMock<Float>()
        self.getClosestValueUseCase = SliderGetClosestValueUseCasableDeprecatedMock<Float>()
    }
}
