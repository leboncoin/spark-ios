//
//  IconButtonViewModelDeprecated.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 13/11/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) import SparkCommon
import SparkTheming

@available(*, deprecated, message: "Not used anymore by SparkButton or SparkUIButton")
class IconButtonViewModelDeprecated: ButtonMainViewModelDeprecated {

    // MARK: - Initialization

    init(
        for frameworkType: FrameworkType,
        theme: any Theme,
        appearance: ButtonAppearance?, // TODO: Remove ASAP the optional
        intent: ButtonIntent,
        variant: ButtonVariant,
        shape: ButtonShape,
        size: ButtonSize
    ) {
        super.init(
            for: frameworkType,
            type: .iconButton,
            theme: theme,
            appearance: appearance,
            intent: intent,
            variant: variant,
            shape: shape,
            size: size
        )
    }
}
