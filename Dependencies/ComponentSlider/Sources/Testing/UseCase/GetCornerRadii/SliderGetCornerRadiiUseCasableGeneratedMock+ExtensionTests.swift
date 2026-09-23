//
//  SliderGetCornerRadiiUseCasableGeneratedMock+ExtensionTests.swift
//  SparkComponentSliderUnitTests
//
//  Created by louis.borlee on 06/12/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
@testable import SparkComponentSlider

@_spi(SI_SPI) extension SliderGetCornerRadiiUseCasableDeprecatedGeneratedMock {
    @available(*, deprecated, message: "Remove ASAP. (21/01/2026)")
    static func mocked(expectedRadii radii: SliderRadiiDeprecated) -> SliderGetCornerRadiiUseCasableDeprecatedGeneratedMock {
        let mock = SliderGetCornerRadiiUseCasableDeprecatedGeneratedMock()
        mock._executeWithThemeAndShape = { _, _ in
            return radii
        }
        return mock
    }
}
