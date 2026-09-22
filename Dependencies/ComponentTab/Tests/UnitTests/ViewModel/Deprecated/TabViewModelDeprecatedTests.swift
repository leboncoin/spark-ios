//
//  TabViewModelDeprecatedDeprecatedTests.swift
//  SparkComponentTabTests
//
//  Created by michael.zimmermann on 01.09.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Combine
@testable import SparkComponentTab
@_spi(SI_SPI) @testable import SparkComponentTabTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkThemingTesting
import XCTest

final class TabViewModelDeprecatedDeprecatedTests: XCTestCase {

    // MARK: - Properties
    var useCase: TabsGetAttributesUseCaseableDeprecatedGeneratedMock!
    var cancellables = Set<AnyCancellable>()
    var theme: ThemeGeneratedMock!

    // MARK: - Setup
    override func setUp() {
        super.setUp()
        self.useCase = TabsGetAttributesUseCaseableDeprecatedGeneratedMock()
        self.theme = ThemeGeneratedMock.mocked()
    }

    // MARK: - Tests
    func test_attributes_published_on_init() throws {
        // Given
        let expect = expectation(description: "Expect attributes to be set.")

        let expectedAttributes = TabsAttributesDeprecated(
            lineHeight: 1,
            itemHeight: 40.0,
            lineColor: ColorTokenGeneratedMock(uiColor: .red),
            backgroundColor: ColorTokenGeneratedMock(uiColor: .blue)
        )

        let content: [TabItemContent] = [.init(icon: nil, title: "Title")]
        self.useCase.executeWithThemeAndSizeAndIsEnabledReturnValue = expectedAttributes

        let sut = TabViewModelDeprecated(
            theme: self.theme,
            apportionsSegmentWidthsByContent: false,
            content: content,
            tabSize: .md,
            useCase: self.useCase
        )

        var attributes: TabsAttributesDeprecated?
        // When
        sut.$tabsAttributes.subscribe(in: &self.cancellables) { attrs in
            attributes = attrs
            expect.fulfill()
        }

        // Then
        wait(for: [expect], timeout: 0.1)
        XCTAssertEqual(attributes, expectedAttributes)
    }

    func test_attributes_published_on_theme_change() throws {
        // Given
        let expect = expectation(description: "Expect attributes to be set.")
        expect.expectedFulfillmentCount = 2

        let expectedAttributes = TabsAttributesDeprecated(
            lineHeight: 1,
            itemHeight: 40.0,
            lineColor: ColorTokenGeneratedMock(uiColor: .red),
            backgroundColor: ColorTokenGeneratedMock(uiColor: .blue)
        )
        let content: [TabItemContent] = [.init(icon: nil, title: "Title")]

        self.useCase.executeWithThemeAndSizeAndIsEnabledReturnValue = expectedAttributes

        let sut = TabViewModelDeprecated(
            theme: self.theme,
            apportionsSegmentWidthsByContent: false,
            content: content,
            tabSize: .md,
            useCase: self.useCase
        )

        // When
        var attributes: TabsAttributesDeprecated?
        sut.$tabsAttributes.subscribe(in: &self.cancellables) { attrs in
            attributes = attrs
            expect.fulfill()
        }

        sut.theme = ThemeGeneratedMock.mocked()

        // Then
        wait(for: [expect], timeout: 0.1)
        XCTAssertEqual(attributes, expectedAttributes)
    }

    func test_attributes_published_on_enabled_change() throws {
        // Given
        let expect = expectation(description: "Expect attributes to be set.")
        expect.expectedFulfillmentCount = 2

        let expectedAttributes = TabsAttributesDeprecated(
            lineHeight: 1,
            itemHeight: 40.0,
            lineColor: ColorTokenGeneratedMock(uiColor: .red),
            backgroundColor: ColorTokenGeneratedMock(uiColor: .blue)
        )
        let content: [TabItemContent] = [.init(icon: nil, title: "Title")]
        self.useCase.executeWithThemeAndSizeAndIsEnabledReturnValue = expectedAttributes

        let sut = TabViewModelDeprecated(
            theme: self.theme,
            apportionsSegmentWidthsByContent: false,
            content: content,
            tabSize: .md,
            useCase: self.useCase
        )

        // When
        var attributes: TabsAttributesDeprecated?
        sut.$tabsAttributes.subscribe(in: &self.cancellables) { attrs in
            attributes = attrs
            expect.fulfill()
        }

        sut.setIsEnabled(false)

        // Then
        wait(for: [expect], timeout: 0.1)
        XCTAssertEqual(attributes, expectedAttributes)
    }

    func test_enable() {
        let content: [TabItemContent] = [.init(icon: nil, title: "Title")]

        let expectedAttributes = TabsAttributesDeprecated(
            lineHeight: 1,
            itemHeight: 40.0,
            lineColor: ColorTokenGeneratedMock(uiColor: .red),
            backgroundColor: ColorTokenGeneratedMock(uiColor: .blue)
        )

        self.useCase.executeWithThemeAndSizeAndIsEnabledReturnValue = expectedAttributes

        let sut = TabViewModelDeprecated(
            theme: self.theme,
            apportionsSegmentWidthsByContent: false,
            content: content,
            tabSize: .md,
            useCase: self.useCase
        )

        sut.setIsEnabled(true)

        XCTAssertEqual(sut.disabledTabs, [false])
    }

    func test_disable() {
        let content: [TabItemContent] = [.init(icon: nil, title: "Title")]

        let expectedAttributes = TabsAttributesDeprecated(
            lineHeight: 1,
            itemHeight: 40.0,
            lineColor: ColorTokenGeneratedMock(uiColor: .red),
            backgroundColor: ColorTokenGeneratedMock(uiColor: .blue)
        )

        self.useCase.executeWithThemeAndSizeAndIsEnabledReturnValue = expectedAttributes

        let sut = TabViewModelDeprecated(
            theme: self.theme,
            apportionsSegmentWidthsByContent: false,
            content: content,
            tabSize: .md,
            useCase: self.useCase
        )

        sut.setIsEnabled(false)

        XCTAssertFalse(sut.isTabEnabled(index: 0))
    }

    func test_disable_single_tab() {
        let content: [TabItemContent] = [.init(icon: nil, title: "Title")]

        let expectedAttributes = TabsAttributesDeprecated(
            lineHeight: 1,
            itemHeight: 40.0,
            lineColor: ColorTokenGeneratedMock(uiColor: .red),
            backgroundColor: ColorTokenGeneratedMock(uiColor: .blue)
        )

        self.useCase.executeWithThemeAndSizeAndIsEnabledReturnValue = expectedAttributes

        let sut = TabViewModelDeprecated(
            theme: self.theme,
            apportionsSegmentWidthsByContent: false,
            content: content,
            tabSize: .md,
            useCase: self.useCase
        )

        sut.disableTab(true, index: 0)

        XCTAssertEqual(sut.disabledTabs, [true], "Expect tab to be disabled")
        XCTAssertTrue(sut.isEnabled, "Expect tab control be enabled")
        XCTAssertFalse(sut.isTabEnabled(index: 0), "Expected single tab not to be enabled")
    }
}
