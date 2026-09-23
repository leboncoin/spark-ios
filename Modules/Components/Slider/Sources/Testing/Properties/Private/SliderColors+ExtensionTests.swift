//
//  SliderColors+ExtensionTests.swift
//  SparkComponentSlider
//
//  Created by louis.borlee on 08/12/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
@testable import SparkComponentSlider
import SparkTheming

extension SliderColorsDeprecated {
    @available(*, deprecated, message: "Remove ASAP. (21/01/2026)")
    static func mocked(colors: any Colors) -> SliderColorsDeprecated {
        return .init(
            track: colors.feedback.alert,
            indicator: colors.accent.accentVariant,
            handle: colors.states.neutralPressed,
            handleActiveIndicator: colors.support.onSupportContainer
        )
    }
}
