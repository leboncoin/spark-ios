//
//  SwitchStatusColors+ExtensionTests.swift
//  SparkComponentSwitch
//
//  Created by robin.lemaire on 07/07/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

@testable import SparkComponentSwitch
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

extension SwitchStatusColors {

    // MARK: - Properties

    static func mocked(
        onColorToken: any ColorToken = ColorTokenGeneratedMock.random(),
        offColorToken: any ColorToken = ColorTokenGeneratedMock.random()
    ) -> Self {
        return .init(
            onColorToken: onColorToken,
            offColorToken: offColorToken
        )
    }
}
