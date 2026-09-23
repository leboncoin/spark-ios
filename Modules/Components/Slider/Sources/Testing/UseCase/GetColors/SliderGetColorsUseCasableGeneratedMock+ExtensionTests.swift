//
//  SliderGetColorsUseCasableGeneratedMock+ExtensionTests.swift
//  SparkComponentSliderUnitTests
//
//  Created by louis.borlee on 06/12/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
@testable import SparkComponentSlider

extension SliderGetColorsUseCasableDeprecatedGeneratedMock {
    @available(*, deprecated, message: "Remove ASAP. (21/01/2026)")
    static func mocked(returnedColors colors: SliderColorsDeprecated) -> SliderGetColorsUseCasableDeprecatedGeneratedMock {
        let mock = SliderGetColorsUseCasableDeprecatedGeneratedMock()
        mock._executeWithThemeAndIntent = { _, _ in
            return colors
        }
        return mock
    }
}
