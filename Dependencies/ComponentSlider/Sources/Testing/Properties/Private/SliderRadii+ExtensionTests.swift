//
//  SliderRadii+ExtensionTests.swift
//  SparkComponentSliderUnitTests
//
//  Created by louis.borlee on 08/12/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
@testable import SparkComponentSlider

extension SliderRadiiDeprecated {
    @available(*, deprecated, message: "Remove ASAP. (21/01/2026)")
    static func mocked() -> SliderRadiiDeprecated {
        return .init(
            trackRadius: 0.123,
            indicatorRadius: 49.3
        )
    }
}
