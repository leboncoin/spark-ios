//
//  DisplayedText+ExtensionTests.swift
//  SparkCoreTests
//
//  Created by robin.lemaire on 14/09/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) @testable import SparkCommon

@_spi(SI_SPI) public extension DisplayedText {

    // MARK: - Properties

    static func mocked(
        text: String = "My text"
    ) -> Self {
        return .init(
            text: text
        )
    }
}
