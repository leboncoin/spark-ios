//
//  TestCase.swift
//  SparkCoreTests
//
//  Created by louis.borlee on 22/09/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import XCTest
import SparkTheme

/// The base class of the XCTest test cases.
/// It loads the Spark configuration once before the tests of the subclass run.
@_spi(SI_SPI) open class TestCase: XCTestCase {

    // MARK: - Set up

    /// Called once before the tests of the class run.
    /// Loads the Spark configuration (theme, fonts, ...) the tested components need.
    override open class func setUp() {
        super.setUp()

        // Load the Spark configuration before any test runs.
        SparkConfiguration.load()
    }
}
