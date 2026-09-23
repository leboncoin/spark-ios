//
//  TextFieldGetAddonPaddingUseCase.swift
//  SparkComponentTextInput
//
//  Created by robin.lemaire on 11/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming
import SwiftUI
@_spi(SI_SPI) import SparkCommon

// sourcery: AutoMockable, AutoMockTest
protocol TextFieldGetAddonPaddingUseCaseable {
    func executeLeft(spacings: TextInputSpacings, configuration leftConfiguration: TextFieldAddonConfiguration) -> EdgeInsets
    func executeRight(spacings: TextInputSpacings, configuration rightConfiguration: TextFieldAddonConfiguration) -> EdgeInsets
}

final class TextFieldGetAddonPaddingUseCase: TextFieldGetAddonPaddingUseCaseable {

    // MARK: - Methods

    func executeLeft(spacings: TextInputSpacings, configuration: TextFieldAddonConfiguration) -> EdgeInsets {
        guard configuration.hasPadding else { return .init(all: .zero) }
        return .init(
            top: .zero,
            leading: spacings.horizontal,
            bottom: .zero,
            trailing: configuration.hasSeparator ? spacings.horizontal : .zero
        )
    }

    func executeRight(spacings: TextInputSpacings, configuration: TextFieldAddonConfiguration) -> EdgeInsets {
        guard configuration.hasPadding else { return .init(all: .zero) }
        return .init(
            top: .zero,
            leading: configuration.hasSeparator ? spacings.horizontal : .zero,
            bottom: .zero,
            trailing: spacings.horizontal
        )
    }
}
