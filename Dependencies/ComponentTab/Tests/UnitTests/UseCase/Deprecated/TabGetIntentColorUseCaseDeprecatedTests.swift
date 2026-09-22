//
//  TabGetIntentColorUseCaseDeprecatedTests.swift
//  SparkComponentTabTests
//
//  Created by alican.aycil on 21.07.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

@testable import SparkComponentTab
import XCTest
@_spi(SI_SPI) import SparkThemingTesting

final class TabGetIntentColorUseCaseDeprecatedTests: XCTestCase {

    // MARK: - Private properties
    private var sut: TabGetIntentColorUseCaseDeprecated!
    private var colors: ColorsGeneratedMock!

    // MARK: - Setup
    override func setUp() {
        super.setUp()
        self.sut = TabGetIntentColorUseCaseDeprecated()
        self.colors = ColorsGeneratedMock.mocked()
    }

    // MARK: - Tests
    func test_execute_main() {
        XCTAssertEqual(self.sut.execute(colors: self.colors, intent: .main).color, self.colors.main.main.color)
    }

    func test_execute_support() {
        XCTAssertEqual(self.sut.execute(colors: self.colors, intent: .support).color, self.colors.support.support.color)
    }
}
