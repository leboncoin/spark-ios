//
//  TestCase.swift
//  SparkCoreTests
//
//  Created by louis.borlee on 22/09/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import XCTest
import SparkTheme

@_spi(SI_SPI) open class TestCase: XCTestCase {

    // MARK: - Set up

    override open class func setUp() {
        super.setUp()

        SparkConfiguration.load()
    }
}
