//
//  TagColors+ExtensionTests.swift
//  SparkComponentTagTests
//
//  Created by robin.lemaire on 07/07/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

@testable import SparkComponentTag
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

extension TagColors {

    // MARK: - Properties

    static func mocked(
        backgroundColor: any ColorToken = ColorTokenGeneratedMock.random(),
        borderColor: any ColorToken = ColorTokenGeneratedMock.random(),
        iconColor: any ColorToken = ColorTokenGeneratedMock.random(),
        textColor: any ColorToken = ColorTokenGeneratedMock.random()
    ) -> Self {
        return .init(
            backgroundColor: backgroundColor,
            borderColor: borderColor,
            iconColor: iconColor,
            textColor: textColor
        )
    }
}
