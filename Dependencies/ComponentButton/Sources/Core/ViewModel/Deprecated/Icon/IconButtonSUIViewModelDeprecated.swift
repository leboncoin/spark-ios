//
//  IconButtonSUIViewModelDeprecated.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 15/01/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon
import SparkTheming

@available(*, deprecated, message: "Not used anymore by SparkButton or SparkUIButton")
final class IconButtonSUIViewModelDeprecated: IconButtonViewModelDeprecated, ButtonMainSUIViewModelDeprecated {

    // MARK: - Properties

    var controlStatus: ControlStatus = .init()

    // MARK: - Published Properties

    @Published private(set) var controlStateImage: ControlStateImage = .init()
    @Published private(set) var controlStateText: ControlStateText?

    // MARK: - Initialization

    init(
        theme: any Theme,
        appearance: ButtonAppearance?, // TODO: Remove ASAP the optional
        intent: ButtonIntent,
        variant: ButtonVariant,
        shape: ButtonShape,
        size: ButtonSize
    ) {
        super.init(
            for: .swiftUI,
            theme: theme,
            appearance: appearance,
            intent: intent,
            variant: variant,
            shape: shape,
            size: size
        )
    }
}

