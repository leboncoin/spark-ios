//
//  SwitchViewModelTests.swift
//  SparkComponentSwitchTests
//
//  Created by robin.lemaire on 26/05/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Testing
import Combine
import UIKit
@testable import SparkComponentSwitch
@_spi(SI_SPI) @testable import SparkComponentSwitchTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonTesting
@_spi(SI_SPI) import SparkThemingTesting
import SparkTheming

@MainActor
@Suite("Switch ViewModel Tests")
struct SwitchViewModelTests {

    // MARK: - Init Tests

    @Test("Properties on init when framework type is UIKit")
    func propertiesOnInitWhenFrameworkTypeIsUIKit() throws {
        try self.testPropertiesOnInit(
            givenFrameworkType: .uiKit
        )
    }

    @Test("Properties on init when framework type is SwiftUI")
    func propertiesOnInitWhenFrameworkTypeIsSwiftUI() throws {
        try self.testPropertiesOnInit(
            givenFrameworkType: .swiftUI
        )
    }

    private func testPropertiesOnInit(
        givenFrameworkType: FrameworkType
    ) throws {
        // GIVEN
        let isOnMock = true
        let alignmentMock: SwitchAlignment = .left
        let intentMock: SwitchIntent = .alert
        let isEnabledMock = true

        let isUIKit = givenFrameworkType == .uiKit

        // WHEN
        let stub = Stub(
            frameworkType: givenFrameworkType,
            isOn: isOnMock,
            alignment: alignmentMock,
            intent: intentMock,
            isEnabled: isEnabledMock,
            isImages: true
        )
        let viewModel = stub.viewModel

        var subscriptions = Set<AnyCancellable>()
        stub.subscribePublishers(on: &subscriptions)

        // THEN
        #expect(viewModel.isOn == isOnMock, "Wrong isOn value")
        #expect((viewModel.theme as? ThemeGeneratedMock) === stub.themeMock, "Wrong theme value")
        #expect(viewModel.alignment == alignmentMock, "Wrong alignment value")
        #expect(viewModel.intent == intentMock, "Wrong intent value")
        #expect(viewModel.isEnabled == isEnabledMock, "Wrong isEnabled value")
        #expect(viewModel.images?.leftValue == stub.imagesMock, "Wrong images value")

        #expect(viewModel.isOnChanged == nil, "Wrong isOnChanged value")

        // **
        // Published properties
        let publishedExpectedContainsValue = (isUIKit ? false : true)
        self.testIsOnChanged(on: stub, expectedValue: nil)
        self.testToggleState(on: stub, expectedContainsValue: publishedExpectedContainsValue)
        self.testColors(on: stub, expectedContainsValue: publishedExpectedContainsValue)
        self.testPosition(on: stub, expectedContainsValue: publishedExpectedContainsValue)
        self.testToggleDotImage(on: stub, expectedContainsValue: publishedExpectedContainsValue)
        self.testDisplayedText(on: stub, expectedContainsValue: publishedExpectedContainsValue)
        self.testTextFont(on: stub, expectedContainsValue: publishedExpectedContainsValue)
        self.testShowToggleLeftSpace(on: stub, expectedValue: isUIKit ? nil : true)

        self.testAllPublishedSinkCount(
            on: stub,
            expectedIsOnChangedPublishedSinkCount: 1,
            expectedIsToggleInteractionEnabledPublishedSinkCount: 1,
            expectedToggleOpacityPublishedSinkCount: 1,
            expectedToggleBackgroundColorTokenPublishedSinkCount: 1,
            expectedToggleDotBackgroundColorTokenPublishedSinkCount: 1,
            expectedToggleDotForegroundColorTokenPublishedSinkCount: 1,
            expectedTextForegroundColorTokenPublishedSinkCount: 1,
            expectedIsToggleOnLeftPublishedSinkCount: 1,
            expectedHorizontalSpacingPublishedSinkCount: 1,
            expectedShowToggleLeftSpacePublishedSinkCount: 1,
            expectedToggleDotImagePublishedSinkCount: 1,
            expectedDisplayedTextPublishedSinkCount: 1,
            expectedTextFontTokenPublishedSinkCount: 1
        )
        // **

        // **
        // Use Cases
        let useCaseNumberOfCalls = (isUIKit ? 0 : 1)
        self.testGetColorsUseCaseMock(
            on: stub,
            numberOfCalls: useCaseNumberOfCalls
        )
        self.testGetImageUseCaseMock(
            on: stub,
            numberOfCalls: useCaseNumberOfCalls
        )
        self.testGetToggleColorUseCaseMock(
            on: stub,
            numberOfCalls: isUIKit ? 0 : 2
        )
        self.testGetPositionUseCaseMock(
            on: stub,
            numberOfCalls: useCaseNumberOfCalls
        )
        self.testGetToggleStateUseCaseMock(
            on: stub,
            numberOfCalls: useCaseNumberOfCalls
        )
        // **

    }

    // MARK: - Load Tests

    @Test("Published properties on load when framework type is UIKit")
    func publishedPropertiesOnLoadWhenFrameworkTypeIsUIKit() throws {
        try self.testPublishedPropertiesOnLoad(
            givenFrameworkType: .uiKit
        )
    }

    @Test("Published properties on load when framework type is SwiftUI")
    func publishedPropertiesOnLoadWhenFrameworkTypeIsSwiftUI() throws {
        try self.testPublishedPropertiesOnLoad(
            givenFrameworkType: .swiftUI
        )
    }

    func testPublishedPropertiesOnLoad(
        givenFrameworkType: FrameworkType
    ) throws {
        // GIVEN
        let isOnMock = true
        let alignmentMock: SwitchAlignment = .left
        let intentMock: SwitchIntent = .alert
        let isEnabledMock = true

        let isUIKit = givenFrameworkType == .uiKit

        // WHEN
        let stub = Stub(
            frameworkType: givenFrameworkType,
            isOn: isOnMock,
            alignment: alignmentMock,
            intent: intentMock,
            isEnabled: isEnabledMock,
            isImages: true
        )
        let viewModel = stub.viewModel

        var subscriptions = Set<AnyCancellable>()
        stub.subscribePublishers(on: &subscriptions)

        // Reset all UseCase mock
        stub.resetMockedData()

        viewModel.load()

        // THEN
        // **
        // Published properties
        let publishedExpectedContainsValue = (isUIKit ? true : false)
        self.testIsOnChanged(on: stub, expectedValue: nil)
        self.testToggleState(on: stub, expectedContainsValue: publishedExpectedContainsValue)
        self.testColors(on: stub, expectedContainsValue: publishedExpectedContainsValue)
        self.testPosition(on: stub, expectedContainsValue: publishedExpectedContainsValue)
        self.testToggleDotImage(on: stub, expectedContainsValue: publishedExpectedContainsValue)
        self.testDisplayedText(on: stub, expectedContainsValue: publishedExpectedContainsValue)
        self.testTextFont(on: stub, expectedContainsValue: publishedExpectedContainsValue)
        self.testShowToggleLeftSpace(on: stub, expectedValue: isUIKit ? stub.isOnMock : nil)

        let publishedSinkCount = isUIKit ? 1 : 0
        self.testAllPublishedSinkCount(
            on: stub,
            expectedIsToggleInteractionEnabledPublishedSinkCount: publishedSinkCount,
            expectedToggleOpacityPublishedSinkCount: publishedSinkCount,
            expectedToggleBackgroundColorTokenPublishedSinkCount: publishedSinkCount,
            expectedToggleDotBackgroundColorTokenPublishedSinkCount: publishedSinkCount,
            expectedToggleDotForegroundColorTokenPublishedSinkCount: publishedSinkCount,
            expectedTextForegroundColorTokenPublishedSinkCount: publishedSinkCount,
            expectedIsToggleOnLeftPublishedSinkCount: publishedSinkCount,
            expectedHorizontalSpacingPublishedSinkCount: publishedSinkCount,
            expectedShowToggleLeftSpacePublishedSinkCount: publishedSinkCount,
            expectedToggleDotImagePublishedSinkCount: publishedSinkCount,
            expectedDisplayedTextPublishedSinkCount: publishedSinkCount,
            expectedTextFontTokenPublishedSinkCount: publishedSinkCount
        )
        // **

        // **
        // Use Cases
        let useCaseNumberOfCalls = (isUIKit ? 1 : 0)
        self.testGetColorsUseCaseMock(
            on: stub,
            numberOfCalls: useCaseNumberOfCalls,
            givenTheme: stub.themeMock,
            givenIntent: intentMock
        )
        self.testGetImageUseCaseMock(
            on: stub,
            numberOfCalls: useCaseNumberOfCalls,
            givenIsOn: isOnMock,
            givenImages: stub.imagesMock
        )
        self.testGetToggleColorUseCaseMock(
            on: stub,
            numberOfCalls: isUIKit ? 2 : 0,
            givenIsOn: isOnMock
        )
        self.testGetPositionUseCaseMock(
            on: stub,
            numberOfCalls: useCaseNumberOfCalls,
            givenTheme: stub.themeMock,
            givenAlignment: alignmentMock
        )
        self.testGetToggleStateUseCaseMock(
            on: stub,
            numberOfCalls: useCaseNumberOfCalls,
            givenTheme: stub.themeMock,
            givenIsEnabled: isEnabledMock
        )
        // **
    }

    // MARK: - Toggle Tests

    @Test("Toggle when isToggleInteractionEnabled is true should update switch")
    func toggleWhenIsToggleInteractionEnabledIsTrueShouldUpdateSwitch() {
        // GIVEN
        let expectedIsOn = true

        let isEnabledMock = false

        let stub = Stub(
            isOn: false,
            alignment: .right,
            intent: .support,
            isEnabled: isEnabledMock,
            isImages: true,
            userInteractionEnabled: true
        )
        let viewModel = stub.viewModel

        var subscriptions = Set<AnyCancellable>()
        stub.subscribePublishers(on: &subscriptions)

        viewModel.load()

        // Reset all UseCase mock
        stub.resetMockedData()

        // WHEN
        viewModel.toggle()

        // THEN
        #expect(viewModel.isOn == expectedIsOn, "Wrong isOn value")

        // **
        // Published properties
        self.testIsOnChanged(on: stub, expectedValue: expectedIsOn)
        self.testToggleState(on: stub)
        self.testColors(on: stub)
        self.testPosition(on: stub, expectedContainsValue: false)
        self.testToggleDotImage(on: stub)
        self.testDisplayedText(on: stub, expectedContainsValue: false)
        self.testTextFont(on: stub, expectedContainsValue: false)
        self.testShowToggleLeftSpace(on: stub, expectedValue: expectedIsOn)

        self.testAllPublishedSinkCount(
            on: stub,
            expectedIsOnChangedPublishedSinkCount: 1,
            expectedIsToggleInteractionEnabledPublishedSinkCount: 1,
            expectedToggleOpacityPublishedSinkCount: 1,
            expectedToggleBackgroundColorTokenPublishedSinkCount: 1,
            expectedToggleDotBackgroundColorTokenPublishedSinkCount: 1,
            expectedToggleDotForegroundColorTokenPublishedSinkCount: 1,
            expectedTextForegroundColorTokenPublishedSinkCount: 1,
            expectedIsToggleOnLeftPublishedSinkCount: 1,
            expectedShowToggleLeftSpacePublishedSinkCount: 1,
            expectedToggleDotImagePublishedSinkCount: 1
        )
        // **

        // **
        // Use Cases
        self.testGetColorsUseCaseMock(
            on: stub,
            numberOfCalls: 0
        )
        self.testGetImageUseCaseMock(
            on: stub,
            numberOfCalls: 1
        )
        self.testGetToggleColorUseCaseMock(
            on: stub,
            numberOfCalls: 2,
            givenIsOn: expectedIsOn
        )
        self.testGetToggleStateUseCaseMock(
            on: stub,
            numberOfCalls: 1,
            givenTheme: stub.themeMock,
            givenIsEnabled: isEnabledMock
        )
        // **
    }

    @Test("Toggle when isToggleInteractionEnabled is false should do nothing")
    func toggleWhenIsToggleInteractionEnabledIsFalseShouldDoNothing() {
        // GIVEN
        let isOnMock = false
        let alignmentMock: SwitchAlignment = .right
        let intentMock: SwitchIntent = .support
        let isEnabledMock = false

        let stub = Stub(
            isOn: isOnMock,
            alignment: alignmentMock,
            intent: intentMock,
            isEnabled: isEnabledMock,
            isImages: false,
            userInteractionEnabled: false
        )
        let viewModel = stub.viewModel

        var subscriptions = Set<AnyCancellable>()
        stub.subscribePublishers(on: &subscriptions)

        viewModel.load()

        // Reset all UseCase mock
        stub.resetMockedData()

        // WHEN
        viewModel.toggle()

        // THEN
        #expect(viewModel.isOn == isOnMock, "Wrong isOn value")

        // **
        // Published properties
        self.testIsOnChanged(on: stub, expectedValue: nil)
        self.testToggleState(on: stub, expectedContainsValue: false)
        self.testColors(on: stub, expectedContainsValue: false)
        self.testPosition(on: stub, expectedContainsValue: false)
        self.testToggleDotImage(on: stub, expectedContainsValue: false)
        self.testDisplayedText(on: stub, expectedContainsValue: false)
        self.testTextFont(on: stub, expectedContainsValue: false)
        self.testShowToggleLeftSpace(on: stub, expectedValue: nil)

        self.testAllPublishedSinkCount(on: stub)
        // **

        // **
        // Use Cases
        self.testGetColorsUseCaseMock(
            on: stub,
            numberOfCalls: 0
        )
        self.testGetImageUseCaseMock(
            on: stub,
            numberOfCalls: 0
        )
        self.testGetToggleColorUseCaseMock(
            on: stub,
            numberOfCalls: 0
        )
        self.testGetToggleStateUseCaseMock(
            on: stub,
            numberOfCalls: 0
        )
        // **
    }

    // MARK: - Setter Tests

    @Test("Set isOn with different new value")
    func setIsOnWithDifferentNewValue() {
        self.testSetIsOn(
            givenIsDifferentNewValue: true
        )
    }

    @Test("Set isOn with same new value")
    func setIsOnWithSameNewValue() {
        self.testSetIsOn(
            givenIsDifferentNewValue: false
        )
    }

    func testSetIsOn(
        givenIsDifferentNewValue: Bool
    ) {
        // GIVEN
        let defaultValue = true
        let newValue = givenIsDifferentNewValue ? !defaultValue : defaultValue

        let stub = Stub(
            isOn: defaultValue,
            isImages: true
        )
        let viewModel = stub.viewModel

        var subscriptions = Set<AnyCancellable>()
        stub.subscribePublishers(on: &subscriptions)

        viewModel.load() // Needed to get colors from usecase one time

        // Reset all UseCase mock
        stub.resetMockedData()

        // WHEN
        viewModel.set(isOn: newValue)

        // THEN
        #expect(viewModel.isOn == newValue, "Wrong isOn value")

        // **
        // Published properties
        self.testIsOnChanged(on: stub, expectedValue: nil)
        self.testToggleState(on: stub, expectedContainsValue: false)
        self.testColors(on: stub, expectedContainsValue: givenIsDifferentNewValue)
        self.testPosition(on: stub, expectedContainsValue: false)
        self.testToggleDotImage(on: stub, expectedContainsValue: givenIsDifferentNewValue)
        self.testDisplayedText(on: stub, expectedContainsValue: false)
        self.testTextFont(on: stub, expectedContainsValue: false)
        self.testShowToggleLeftSpace(on: stub, expectedValue: givenIsDifferentNewValue ? newValue : nil)

        let publishedExpectedContainsValue = givenIsDifferentNewValue ? 1 : 0
        self.testAllPublishedSinkCount(
            on: stub,
            expectedToggleBackgroundColorTokenPublishedSinkCount: publishedExpectedContainsValue,
            expectedToggleDotBackgroundColorTokenPublishedSinkCount: publishedExpectedContainsValue,
            expectedToggleDotForegroundColorTokenPublishedSinkCount: publishedExpectedContainsValue,
            expectedTextForegroundColorTokenPublishedSinkCount: publishedExpectedContainsValue,
            expectedIsToggleOnLeftPublishedSinkCount: publishedExpectedContainsValue,
            expectedShowToggleLeftSpacePublishedSinkCount: publishedExpectedContainsValue,
            expectedToggleDotImagePublishedSinkCount: publishedExpectedContainsValue
        )
        // **

        // **
        // Use Cases
        self.testGetColorsUseCaseMock(
            on: stub,
            numberOfCalls: 0
        )
        self.testGetImageUseCaseMock(
            on: stub,
            numberOfCalls: givenIsDifferentNewValue ? 1 : 0
        )
        self.testGetToggleColorUseCaseMock(
            on: stub,
            numberOfCalls: givenIsDifferentNewValue ? 2 : 0,
            givenIsOn: newValue
        )
        // **
    }

    @Test("Set theme")
    func setTheme() {
        // GIVEN
        let newTheme = ThemeGeneratedMock.mocked()

        let isOnMock = false
        let alignmentMock: SwitchAlignment = .right
        let intentMock: SwitchIntent = .support
        let isEnabledMock = false

        let stub = Stub(
            isOn: isOnMock,
            alignment: alignmentMock,
            intent: intentMock,
            isEnabled: isEnabledMock,
            isImages: true
        )
        let viewModel = stub.viewModel

        var subscriptions = Set<AnyCancellable>()
        stub.subscribePublishers(on: &subscriptions)

        viewModel.load() // Needed to get colors from usecase one time

        // Reset all UseCase mock
        stub.resetMockedData()

        // WHEN
        viewModel.set(theme: newTheme)

        // THEN
        #expect((viewModel.theme as? ThemeGeneratedMock) === newTheme, "Wrong theme value")

        // **
        // Published properties
        self.testIsOnChanged(on: stub, expectedValue: nil)
        self.testToggleState(on: stub)
        self.testColors(on: stub)
        self.testPosition(on: stub)
        self.testToggleDotImage(on: stub)
        self.testDisplayedText(on: stub)
        self.testTextFont(on: stub, givenNewTheme: newTheme)
        self.testShowToggleLeftSpace(on: stub, expectedValue: stub.isOnMock)

        self.testAllPublishedSinkCount(
            on: stub,
            expectedIsToggleInteractionEnabledPublishedSinkCount: 1,
            expectedToggleOpacityPublishedSinkCount: 1,
            expectedToggleBackgroundColorTokenPublishedSinkCount: 1,
            expectedToggleDotBackgroundColorTokenPublishedSinkCount: 1,
            expectedToggleDotForegroundColorTokenPublishedSinkCount: 1,
            expectedTextForegroundColorTokenPublishedSinkCount: 1,
            expectedIsToggleOnLeftPublishedSinkCount: 1,
            expectedHorizontalSpacingPublishedSinkCount: 1,
            expectedShowToggleLeftSpacePublishedSinkCount: 1,
            expectedToggleDotImagePublishedSinkCount: 1,
            expectedDisplayedTextPublishedSinkCount: 1,
            expectedTextFontTokenPublishedSinkCount: 1
        )
        // **

        // **
        // Use Cases
        self.testGetColorsUseCaseMock(
            on: stub,
            numberOfCalls: 1,
            givenTheme: newTheme,
            givenIntent: intentMock
        )
        self.testGetImageUseCaseMock(
            on: stub,
            numberOfCalls: 1
        )
        self.testGetToggleColorUseCaseMock(
            on: stub,
            numberOfCalls: 2,
            givenIsOn: isOnMock
        )
        self.testGetPositionUseCaseMock(
            on: stub,
            numberOfCalls: 1,
            givenTheme: newTheme,
            givenAlignment: alignmentMock
        )
        self.testGetToggleStateUseCaseMock(
            on: stub,
            numberOfCalls: 1,
            givenTheme: newTheme,
            givenIsEnabled: isEnabledMock
        )
        // **
    }

    @Test("Set alignment with different new value")
    func setAlignmentWithDifferentNewValue() {
        self.testSetAlignment(
            givenIsDifferentNewValue: true
        )
    }

    @Test("Set alignment with same new value")
    func setAlignmentWithSameNewValue() {
        self.testSetAlignment(
            givenIsDifferentNewValue: false
        )
    }

    func testSetAlignment(
        givenIsDifferentNewValue: Bool
    ) {
        // GIVEN
        let defaultValue: SwitchAlignment = .right
        let newValue: SwitchAlignment = givenIsDifferentNewValue ? .left : defaultValue

        let stub = Stub(
            alignment: defaultValue
        )
        let viewModel = stub.viewModel

        var subscriptions = Set<AnyCancellable>()
        stub.subscribePublishers(on: &subscriptions)

        viewModel.load() // Needed to get colors from usecase one time

        // Reset all UseCase mock
        stub.resetMockedData()

        // WHEN
        viewModel.set(alignment: newValue)

        // THEN
        #expect(viewModel.alignment == newValue, "Wrong alignment value")

        // **
        // Published properties
        self.testIsOnChanged(on: stub, expectedValue: nil)
        self.testToggleState(on: stub, expectedContainsValue: false)
        self.testColors(on: stub, expectedContainsValue: false)
        self.testPosition(on: stub, expectedContainsValue: givenIsDifferentNewValue)
        self.testToggleDotImage(on: stub, expectedContainsValue: false)
        self.testDisplayedText(on: stub, expectedContainsValue: false)
        self.testTextFont(on: stub, expectedContainsValue: false)
        self.testShowToggleLeftSpace(on: stub, expectedValue: nil)

        let publishedSinkCount = givenIsDifferentNewValue ? 1 : 0
        self.testAllPublishedSinkCount(
            on: stub,
            expectedIsToggleOnLeftPublishedSinkCount: publishedSinkCount,
            expectedHorizontalSpacingPublishedSinkCount: publishedSinkCount
        )
        // **

        // Use Cases
        self.testGetPositionUseCaseMock(
            on: stub,
            numberOfCalls: givenIsDifferentNewValue ? 1 : 0,
            givenTheme: stub.themeMock,
            givenAlignment: newValue
        )
    }

    @Test("Set intent with different new value")
    func setIntentWithDifferentNewValue() {
        self.testSetIntent(
            givenIsDifferentNewValue: true
        )
    }

    @Test("Set intent with same new value")
    func setIntentWithSameNewValue() {
        self.testSetIntent(
            givenIsDifferentNewValue: false
        )
    }

    private func testSetIntent(
        givenIsDifferentNewValue: Bool
    ) {
        // GIVEN
        let defaultValue: SwitchIntent = .main
        let newValue: SwitchIntent = givenIsDifferentNewValue ? .error : defaultValue

        let isOnMock = true

        let stub = Stub(
            isOn: isOnMock,
            intent: defaultValue
        )
        let viewModel = stub.viewModel

        var subscriptions = Set<AnyCancellable>()
        stub.subscribePublishers(on: &subscriptions)

        viewModel.load() // Needed to get colors from usecase one time

        // Reset all UseCase mock
        stub.resetMockedData()

        // WHEN
        viewModel.set(intent: newValue)

        // THEN
        #expect(viewModel.intent == newValue, "Wrong intent value")

        // **
        // Published properties
        self.testIsOnChanged(on: stub, expectedValue: nil)
        self.testToggleState(on: stub, expectedContainsValue: false)
        self.testColors(on: stub, expectedContainsValue: givenIsDifferentNewValue)
        self.testPosition(on: stub, expectedContainsValue: false)
        self.testToggleDotImage(on: stub, expectedContainsValue: false)
        self.testDisplayedText(on: stub, expectedContainsValue: false)
        self.testTextFont(on: stub, expectedContainsValue: false)
        self.testShowToggleLeftSpace(on: stub, expectedValue: nil)

        let publishedSinkCount = givenIsDifferentNewValue ? 1 : 0
        self.testAllPublishedSinkCount(
            on: stub,
            expectedToggleBackgroundColorTokenPublishedSinkCount: publishedSinkCount,
            expectedToggleDotBackgroundColorTokenPublishedSinkCount: publishedSinkCount,
            expectedToggleDotForegroundColorTokenPublishedSinkCount: publishedSinkCount,
            expectedTextForegroundColorTokenPublishedSinkCount: publishedSinkCount
        )
        // **

        // **
        // Use Cases
        self.testGetColorsUseCaseMock(
            on: stub,
            numberOfCalls: givenIsDifferentNewValue ? 1 : 0,
            givenTheme: stub.themeMock,
            givenIntent: newValue
        )
        self.testGetToggleColorUseCaseMock(
            on: stub,
            numberOfCalls: givenIsDifferentNewValue ? 2 : 0,
            givenIsOn: isOnMock
        )
        // **
    }

    @Test("Set isEnabled with different new value")
    func setIsEnabledWithDifferentNewValue() {
        self.testSetIsEnabled(
            givenIsDifferentNewValue: true
        )
    }

    @Test("Set isEnabled with same new value")
    func setIsEnabledWithSameNewValue() {
        self.testSetIsEnabled(
            givenIsDifferentNewValue: false
        )
    }

    func testSetIsEnabled(
        givenIsDifferentNewValue: Bool
    ) {
        // GIVEN
        let defaultValue = true
        let newValue = givenIsDifferentNewValue ? false : defaultValue

        let intentMock: SwitchIntent = .neutral
        let isOnMock = true

        let stub = Stub(
            isOn: isOnMock,
            intent: intentMock,
            isEnabled: defaultValue
        )
        let viewModel = stub.viewModel

        var subscriptions = Set<AnyCancellable>()
        stub.subscribePublishers(on: &subscriptions)

        viewModel.load() // Needed to get colors from usecase one time

        // Reset all UseCase mock
        stub.resetMockedData()

        // WHEN
        viewModel.set(isEnabled: newValue)

        // THEN
        #expect(viewModel.isEnabled == newValue, "Wrong isEnabled value")

        // **
        // Published properties
        self.testIsOnChanged(on: stub, expectedValue: nil)
        self.testToggleState(on: stub, expectedContainsValue: givenIsDifferentNewValue)
        self.testColors(on: stub, expectedContainsValue: givenIsDifferentNewValue)
        self.testPosition(on: stub, expectedContainsValue: false)
        self.testToggleDotImage(on: stub, expectedContainsValue: false)
        self.testDisplayedText(on: stub, expectedContainsValue: false)
        self.testTextFont(on: stub, expectedContainsValue: false)
        self.testShowToggleLeftSpace(on: stub, expectedValue: nil)

        let publishedSinkCount = givenIsDifferentNewValue ? 1 : 0
        self.testAllPublishedSinkCount(
            on: stub,
            expectedIsToggleInteractionEnabledPublishedSinkCount: publishedSinkCount,
            expectedToggleOpacityPublishedSinkCount: publishedSinkCount,
            expectedToggleBackgroundColorTokenPublishedSinkCount: publishedSinkCount,
            expectedToggleDotBackgroundColorTokenPublishedSinkCount: publishedSinkCount,
            expectedToggleDotForegroundColorTokenPublishedSinkCount: publishedSinkCount,
            expectedTextForegroundColorTokenPublishedSinkCount: publishedSinkCount
        )
        // **

        // **
        // Use Cases
        self.testGetColorsUseCaseMock(
            on: stub,
            numberOfCalls: 0
        )
        self.testGetToggleColorUseCaseMock(
            on: stub,
            numberOfCalls: givenIsDifferentNewValue ? 2 : 0,
            givenIsOn: isOnMock
        )
        self.testGetToggleStateUseCaseMock(
            on: stub,
            numberOfCalls: givenIsDifferentNewValue ? 1 : 0,
            givenTheme: stub.themeMock,
            givenIsEnabled: newValue
        )
        // **
    }

    @Test("Set images with different new value")
    func setImagesWithDifferentNewValue() {
        self.testSetImages(
            givenIsDifferentNewValue: true
        )
    }

    @Test("Set images with same new value")
    func setImagesWithSameNewValue() {
        self.testSetImages(
            givenIsDifferentNewValue: false
        )
    }

    func testSetImages(
        givenIsDifferentNewValue: Bool
    ) {
        // GIVEN
        let newValue = SwitchUIImages(on: UIImage(), off: UIImage())

        let isOnMock = true

        let stub = Stub(
            isOn: isOnMock,
            isImages: false
        )
        let viewModel = stub.viewModel

        var subscriptions = Set<AnyCancellable>()
        stub.subscribePublishers(on: &subscriptions)

        viewModel.load() // Needed to get colors from usecase one time

        // Reset all UseCase mock
        stub.resetMockedData()

        // WHEN
        viewModel.set(images: givenIsDifferentNewValue ? .left(newValue) : nil)

        // THEN
        if givenIsDifferentNewValue {
            #expect(viewModel.images?.leftValue == newValue, "Wrong images value")
        } else {
            #expect(viewModel.images?.leftValue == nil, "Wrong images value")
        }

        // **
        // Published properties
        self.testIsOnChanged(on: stub, expectedValue: nil)
        self.testToggleState(on: stub, expectedContainsValue: false)
        self.testColors(on: stub, expectedContainsValue: false)
        self.testPosition(on: stub, expectedContainsValue: false)
        self.testToggleDotImage(on: stub, expectedContainsValue: givenIsDifferentNewValue)
        self.testDisplayedText(on: stub, expectedContainsValue: false)
        self.testTextFont(on: stub, expectedContainsValue: false)
        self.testShowToggleLeftSpace(on: stub, expectedValue: nil)

        self.testAllPublishedSinkCount(
            on: stub,
            expectedToggleDotImagePublishedSinkCount: givenIsDifferentNewValue ? 1 : 0
        )
        // **

        // Use Cases
        self.testGetImageUseCaseMock(
            on: stub,
            numberOfCalls: givenIsDifferentNewValue ? 1 : 0,
            givenIsOn: isOnMock,
            givenImages: givenIsDifferentNewValue ? newValue : nil
        )
    }

    @Test("Set text when displayedTextViewModel textChanged return true and new value is NOT nil")
    func setTextWhenDisplayedTextViewModelTextChangedReturnTrueAndNewValueIsNOTNil() {
        self.testSetText(
            newValueIsNil: false,
            givenIsDifferentNewValue: true
        )
    }

    @Test("Set text when displayedTextViewModel textChanged return true and new value is nil")
    func setTextWhenDisplayedTextViewModelTextChangedReturnTrueAndNewValueIsNil() {
        self.testSetText(
            newValueIsNil: true,
            givenIsDifferentNewValue: true
        )
    }

    @Test("Set text when displayedTextViewModel textChanged return false")
    func setTextWhenDisplayedTextViewModelTextChangedReturnFalse() {
        self.testSetText(
            givenIsDifferentNewValue: false
        )
    }

    private func testSetText(
        newValueIsNil: Bool = true,
        givenIsDifferentNewValue: Bool
    ) {
        // GIVEN
        let newValue: String? = newValueIsNil ? nil : "My New Text"

        let stub = Stub(
            text: "Text"
        )
        let viewModel = stub.viewModel

        var subscriptions = Set<AnyCancellable>()
        stub.subscribePublishers(on: &subscriptions)

        viewModel.load() // Needed to get colors from usecase one time

        // Reset all dependencies mocked data
        stub.resetMockedData()

        // WHEN
        stub.displayedTextViewModelMock.textChangedWithTextReturnValue = givenIsDifferentNewValue
        viewModel.set(text: newValue)

        // THEN

        // **
        // Published properties
        let publishedExpectedContainsValue = (givenIsDifferentNewValue && !newValueIsNil)
        self.testIsOnChanged(on: stub, expectedValue: nil)
        self.testToggleState(on: stub, expectedContainsValue: false)
        self.testColors(
            on: stub,
            expectedContainsValue: false,
            expectedTextForegroundColorContainsValue: publishedExpectedContainsValue
        )
        self.testPosition(on: stub, expectedContainsValue: givenIsDifferentNewValue)
        self.testToggleDotImage(on: stub, expectedContainsValue: false)
        self.testDisplayedText(on: stub, expectedContainsValue: givenIsDifferentNewValue)
        self.testTextFont(on: stub, expectedContainsValue: publishedExpectedContainsValue)
        self.testShowToggleLeftSpace(on: stub, expectedValue: nil)

        let publishedSinkCount = (givenIsDifferentNewValue && !newValueIsNil) ? 1 : 0
        self.testAllPublishedSinkCount(
            on: stub,
            expectedTextForegroundColorTokenPublishedSinkCount: publishedSinkCount,
            expectedIsToggleOnLeftPublishedSinkCount: publishedSinkCount,
            expectedHorizontalSpacingPublishedSinkCount: givenIsDifferentNewValue ? 1 : 0,
            expectedDisplayedTextPublishedSinkCount: givenIsDifferentNewValue ? 1 : 0,
            expectedTextFontTokenPublishedSinkCount: publishedSinkCount
        )
        // **

        // **
        // DisplayedText ViewModel
        #expect(stub.displayedTextViewModelMock.textChangedWithTextCallsCount == 1, "Wrong call number on textChanged on displayedTextViewModel")
        #expect(stub.displayedTextViewModelMock.textChangedWithTextReceivedText == newValue, "Wrong textChanged parameter on displayedTextViewModel")
        // **

        // Use Cases
        self.testGetPositionUseCaseMock(
            on: stub,
            numberOfCalls: givenIsDifferentNewValue ? 1 : 0
        )
    }

    @Test("Set attributedText when displayedTextViewModel attributedTextChanged return true")
    func setAttributedTextWhenDisplayedTextViewModelAttributedTextChangedReturnTrue() {
        self.testSetAttributedText(
            givenIsDifferentNewValue: true
        )
    }

    @Test("Set attributedText when displayedTextViewModel attributedTextChanged return false")
    func setAttributedTextWhenDisplayedTextViewModelAttributedTextChangedReturnFalse() {
        self.testSetAttributedText(
            givenIsDifferentNewValue: false
        )
    }

    private func testSetAttributedText(
        givenIsDifferentNewValue: Bool
    ) {
        // GIVEN
        let newValue = NSAttributedString(string: "My new AT Switch")

        let stub = Stub(
            attributedText: .init(string: "My AT Switch")
        )
        let viewModel = stub.viewModel

        var subscriptions = Set<AnyCancellable>()
        stub.subscribePublishers(on: &subscriptions)

        viewModel.load() // Needed to get colors from usecase one time

        // Reset all dependencies mocked data
        stub.resetMockedData()

        // WHEN
        stub.displayedTextViewModelMock.attributedTextChangedWithAttributedTextReturnValue = givenIsDifferentNewValue
        viewModel.set(attributedText: .left(newValue))

        // THEN
        // **
        // Published properties
        self.testIsOnChanged(on: stub, expectedValue: nil)
        self.testToggleState(on: stub, expectedContainsValue: false)
        self.testColors(on: stub, expectedContainsValue: false)
        self.testPosition(on: stub, expectedContainsValue: givenIsDifferentNewValue)
        self.testToggleDotImage(on: stub, expectedContainsValue: false)
        self.testDisplayedText(on: stub, expectedContainsValue: givenIsDifferentNewValue)
        self.testTextFont(on: stub, expectedContainsValue: false)
        self.testShowToggleLeftSpace(on: stub, expectedValue: nil)

        let publishedSinkCount = (givenIsDifferentNewValue) ? 1 : 0
        self.testAllPublishedSinkCount(
            on: stub,
            expectedIsToggleOnLeftPublishedSinkCount: publishedSinkCount,
            expectedHorizontalSpacingPublishedSinkCount: publishedSinkCount,
            expectedDisplayedTextPublishedSinkCount: publishedSinkCount

        )
        // **

        // **
        // DisplayedText ViewModel
        #expect(stub.displayedTextViewModelMock.attributedTextChangedWithAttributedTextCallsCount == 1, "Wrong call number on attributedText on displayedTextViewModel")
        #expect(stub.displayedTextViewModelMock.attributedTextChangedWithAttributedTextReceivedAttributedText?.leftValue == newValue, "Wrong attributedText parameter on displayedTextViewModel")
        // **
    }
}

// MARK: - Testing Dependencies

private extension SwitchViewModelTests {

    func testGetColorsUseCaseMock(
        on stub: Stub,
        numberOfCalls: Int,
        givenTheme: (any Theme)? = nil,
        givenIntent: SwitchIntent? = nil
    ) {
        #expect(stub.getColorsUseCaseMock.executeWithIntentAndColorsAndDimsCallsCount == numberOfCalls, "Wrong call number on execute on getColorsUseCase")

        if numberOfCalls > 0, let givenTheme, let givenIntent {
            let getColorsUseCaseArgs = stub.getColorsUseCaseMock.executeWithIntentAndColorsAndDimsReceivedArguments
            #expect(getColorsUseCaseArgs?.intent == givenIntent, "Wrong intent parameter on execute on getColorsUseCase")
            #expect((getColorsUseCaseArgs?.colors as? ColorsGeneratedMock) === (givenTheme.colors as? ColorsGeneratedMock), "Wrong colors parameter on execute on getColorsUseCase")
            #expect((getColorsUseCaseArgs?.dims as? DimsGeneratedMock) === (givenTheme.dims as? DimsGeneratedMock), "Wrong dims parameter on execute on getColorsUseCase")
        }
    }

    func testGetImageUseCaseMock(
        on stub: Stub,
        numberOfCalls: Int,
        givenIsOn: Bool? = nil,
        givenImages: SwitchUIImages? = nil
    ) {
        #expect(stub.getImagesStateUseCaseMock.executeWithIsOnAndImagesCallsCount == numberOfCalls, "Wrong call number on execute on getImageUseCase")

        if numberOfCalls > 0, let givenIsOn {
            let getImageUseCaseArgs = stub.getImagesStateUseCaseMock.executeWithIsOnAndImagesReceivedArguments
            #expect(getImageUseCaseArgs?.isOn == givenIsOn, "Wrong isOn parameter on execute on getImageUseCase")

            if let givenImages {
                #expect(getImageUseCaseArgs?.images.leftValue == givenImages, "Wrong images parameter on execute on getImageUseCase")
            } else {
                #expect(getImageUseCaseArgs?.images == nil, "images parameter should be nil on execute on getImageUseCase")
            }
        }
    }

    func testGetToggleColorUseCaseMock(
        on stub: Stub,
        numberOfCalls: Int,
        givenIsOn: Bool? = nil
    ) {
        let givenStatusAndStateColors = [
            stub.colorsMock.toggleBackgroundColors,
            stub.colorsMock.toggleDotForegroundColors
        ]

        #expect(stub.getToggleColorUseCaseMock.executeWithIsOnAndStatusAndStateColorCallsCount == numberOfCalls, "Wrong call number on execute on getToggleColorUseCase")

        if numberOfCalls > 0, let givenIsOn {
            let getToggleColorUseCaseInvocations = stub.getToggleColorUseCaseMock.executeWithIsOnAndStatusAndStateColorReceivedInvocations

            guard getToggleColorUseCaseInvocations.count == numberOfCalls else {
                Issue.record("Wrong invocation number on execute on getToggleColorUseCase")
                return
            }

            guard givenStatusAndStateColors.count == 2 else {
                Issue.record("Wrong number of item into givenStatusAndStateColors")
                return
            }

            for (index, args) in getToggleColorUseCaseInvocations.enumerated() {
                let givenStatusAndStateColorsIndex = (index % 2 == 0) ? 0 : 1

                #expect(args.isOn == givenIsOn, "Wrong isOn parameter on \(index) execute on getToggleColorUseCase")
                #expect(args.statusAndStateColor == givenStatusAndStateColors[givenStatusAndStateColorsIndex], "Wrong statusAndStateColor parameter on \(index) execute on getToggleColorUseCase")
            }
        }
    }

    func testGetPositionUseCaseMock(
        on stub: Stub,
        numberOfCalls: Int,
        givenTheme: (any Theme)? = nil,
        givenAlignment: SwitchAlignment? = nil
    ) {
        #expect(stub.getPositionUseCaseMock.executeWithAlignmentAndSpacingAndContainsTextCallsCount == numberOfCalls, "Wrong call number on execute on getPositionUseCase")

        if numberOfCalls > 0, let givenTheme, let givenAlignment {
            let getPositionUseCaseArgs = stub.getPositionUseCaseMock.executeWithAlignmentAndSpacingAndContainsTextReceivedArguments
            #expect(getPositionUseCaseArgs?.alignment == givenAlignment, "Wrong alignment parameter on execute on getPositionUseCase")
            #expect((getPositionUseCaseArgs?.spacing as? LayoutSpacingGeneratedMock) === (givenTheme.layout.spacing as? LayoutSpacingGeneratedMock), "Wrong spacing parameter on execute on getPositionUseCase")
            #expect(getPositionUseCaseArgs?.containsText == stub.displayedTextViewModelMock.containsText, "Wrong containsText parameter on execute on getContentUseCase")
        }
    }

    func testGetToggleStateUseCaseMock(
        on stub: Stub,
        numberOfCalls: Int,
        givenTheme: (any Theme)? = nil,
        givenIsEnabled: Bool? = nil
    ) {
        #expect(stub.getToggleStateUseCaseMock.executeWithIsEnabledAndDimsCallsCount == numberOfCalls, "Wrong call number on execute on getToggleStateUseCase")

        if numberOfCalls > 0, let givenTheme, let givenIsEnabled {
            let getToggleStateUseCaseArgs = stub.getToggleStateUseCaseMock.executeWithIsEnabledAndDimsReceivedArguments
            #expect(getToggleStateUseCaseArgs?.isEnabled == givenIsEnabled, "Wrong isEnabled parameter on execute on getToggleStateUseCase")
            #expect((getToggleStateUseCaseArgs?.dims as? DimsGeneratedMock) === (givenTheme.dims as? DimsGeneratedMock), "Wrong dims parameter on execute on getToggleStateUseCase")
        }
    }
}

// MARK: - Testing Publisher

private extension SwitchViewModelTests {

    func testAllPublishedSinkCount(
        on stub: Stub,
        expectedIsOnChangedPublishedSinkCount: Int = 0,
        expectedIsToggleInteractionEnabledPublishedSinkCount: Int = 0,
        expectedToggleOpacityPublishedSinkCount: Int = 0,
        expectedToggleBackgroundColorTokenPublishedSinkCount: Int = 0,
        expectedToggleDotBackgroundColorTokenPublishedSinkCount: Int = 0,
        expectedToggleDotForegroundColorTokenPublishedSinkCount: Int = 0,
        expectedTextForegroundColorTokenPublishedSinkCount: Int = 0,
        expectedIsToggleOnLeftPublishedSinkCount: Int = 0,
        expectedHorizontalSpacingPublishedSinkCount: Int = 0,
        expectedShowToggleLeftSpacePublishedSinkCount: Int = 0,
        expectedToggleDotImagePublishedSinkCount: Int = 0,
        expectedDisplayedTextPublishedSinkCount: Int = 0,
        expectedTextFontTokenPublishedSinkCount: Int = 0
    ) {
        expectPublisherSinkCountEqual(
            on: stub.isOnChangedPublisherMock,
            expectedIsOnChangedPublishedSinkCount
        )

        expectPublisherSinkCountEqual(
            on: stub.isToggleInteractionEnabledPublisherMock,
            expectedIsToggleInteractionEnabledPublishedSinkCount
        )
        expectPublisherSinkCountEqual(
            on: stub.toggleOpacityPublisherMock,
            expectedToggleOpacityPublishedSinkCount
        )

        expectPublisherSinkCountEqual(
            on: stub.toggleBackgroundColorTokenPublisherMock,
            expectedToggleBackgroundColorTokenPublishedSinkCount
        )
        expectPublisherSinkCountEqual(
            on: stub.toggleDotBackgroundColorTokenPublisherMock,
            expectedToggleDotBackgroundColorTokenPublishedSinkCount
        )
        expectPublisherSinkCountEqual(
            on: stub.toggleDotForegroundColorTokenPublisherMock,
            expectedToggleDotForegroundColorTokenPublishedSinkCount
        )
        expectPublisherSinkCountEqual(
            on: stub.textForegroundColorTokenPublisherMock,
            expectedTextForegroundColorTokenPublishedSinkCount
        )

        expectPublisherSinkCountEqual(
            on: stub.horizontalSpacingPublisherMock,
            expectedHorizontalSpacingPublishedSinkCount
        )
        expectPublisherSinkCountEqual(
            on: stub.showToggleLeftSpacePublisherMock,
            expectedShowToggleLeftSpacePublishedSinkCount
        )

        expectPublisherSinkCountEqual(
            on: stub.toggleDotImagesStatePublisherMock,
            expectedToggleDotImagePublishedSinkCount
        )

        expectPublisherSinkCountEqual(
            on: stub.displayedTextPublisherMock,
            expectedDisplayedTextPublishedSinkCount
        )

        expectPublisherSinkCountEqual(
            on: stub.textFontTokenPublisherMock,
            expectedTextFontTokenPublishedSinkCount
        )
    }

    func testIsOnChanged(
        on stub: Stub,
        expectedValue: Bool? = true
    ) {
        if let expectedValue {
            expectPublisherSinkValueEqual(
                on: stub.isOnChangedPublisherMock,
                expectedValue
            )
        } else {
            expectPublisherSinkValueNil(
                on: stub.isOnChangedPublisherMock
            )
        }
    }

    func testPosition(
        on stub: Stub,
        expectedContainsValue: Bool = true
    ) {
        if expectedContainsValue {
            expectPublisherSinkValueEqual(
                on: stub.isToggleOnLeftPublisherMock,
                stub.positionMock.isToggleOnLeft
            )
            expectPublisherSinkValueEqual(
                on: stub.horizontalSpacingPublisherMock,
                stub.positionMock.horizontalSpacing
            )
        } else {
            expectPublisherSinkValueNil(
                on: stub.isToggleOnLeftPublisherMock
            )
            expectPublisherSinkValueNil(
                on: stub.horizontalSpacingPublisherMock
            )
        }
    }

    func testColors(
        on stub: Stub,
        expectedContainsValue: Bool = true,
        expectedTextForegroundColorContainsValue: Bool = false
    ) {
        if expectedContainsValue {
            expectPublisherSinkValueIdentical(
                on: stub.toggleBackgroundColorTokenPublisherMock,
                stub.colorTokenMock
            )
            expectPublisherSinkValueIdentical(
                on: stub.toggleDotBackgroundColorTokenPublisherMock,
                stub.colorsMock.toggleDotBackgroundColor as? ColorTokenGeneratedMock
            )
            expectPublisherSinkValueIdentical(
                on: stub.toggleDotForegroundColorTokenPublisherMock,
                stub.colorTokenMock
            )
        } else {
            expectPublisherSinkValueNil(
                on: stub.toggleBackgroundColorTokenPublisherMock
            )
            expectPublisherSinkValueNil(
                on: stub.toggleDotBackgroundColorTokenPublisherMock
            )
            expectPublisherSinkValueNil(
                on: stub.toggleDotForegroundColorTokenPublisherMock
            )
        }

        if expectedContainsValue || expectedTextForegroundColorContainsValue {
            expectPublisherSinkValueIdentical(
                on: stub.textForegroundColorTokenPublisherMock,
                stub.colorsMock.textForegroundColor as? ColorTokenGeneratedMock
            )
        } else {
            expectPublisherSinkValueNil(
                on: stub.textForegroundColorTokenPublisherMock
            )
        }
    }

    func testToggleState(
        on stub: Stub,
        expectedContainsValue: Bool = true
    ) {
        if expectedContainsValue {
            expectPublisherSinkValueEqual(
                on: stub.isToggleInteractionEnabledPublisherMock,
                stub.toggleStateMock.interactionEnabled
            )
            expectPublisherSinkValueEqual(
                on: stub.toggleOpacityPublisherMock,
                stub.toggleStateMock.opacity
            )
        } else {
            expectPublisherSinkValueNil(
                on: stub.isToggleInteractionEnabledPublisherMock
            )
            expectPublisherSinkValueNil(
                on: stub.toggleOpacityPublisherMock
            )
        }
    }

    func testToggleDotImage(
        on stub: Stub,
        expectedContainsValue: Bool = true
    ) {
        if expectedContainsValue {
            expectPublisherSinkValueEqual(
                on: stub.toggleDotImagesStatePublisherMock,
                .mocked()
            )
        } else {
            expectPublisherSinkValueNil(
                on: stub.toggleDotImagesStatePublisherMock
            )
        }
    }

    func testDisplayedText(
        on stub: Stub,
        givenNewTheme: (any Theme)? = nil,
        expectedContainsValue: Bool = true
    ) {
        if expectedContainsValue {
            expectPublisherSinkValueEqual(
                on: stub.displayedTextPublisherMock,
                .mocked()
            )
        } else {
            expectPublisherSinkValueNil(
                on: stub.displayedTextPublisherMock
            )
        }
    }

    func testTextFont(
        on stub: Stub,
        givenNewTheme: (any Theme)? = nil,
        expectedContainsValue: Bool = true
    ) {
        if expectedContainsValue {
            let themeMock = givenNewTheme ?? stub.themeMock
            expectPublisherSinkValueIdentical(
                on: stub.textFontTokenPublisherMock,
                themeMock.typography.body1 as? TypographyFontTokenGeneratedMock
            )
        } else {
            expectPublisherSinkValueNil(
                on: stub.textFontTokenPublisherMock
            )
        }
    }

    func testShowToggleLeftSpace(
        on stub: Stub,
        expectedValue: Bool? = nil
    ) {
        if let expectedValue {
            expectPublisherSinkValueEqual(
                on: stub.showToggleLeftSpacePublisherMock,
                expectedValue
            )
        } else {
            expectPublisherSinkValueNil(
                on: stub.showToggleLeftSpacePublisherMock
            )
        }
    }
}

// MARK: - Stub

private final class Stub {

    // MARK: - Properties

    let viewModel: SwitchViewModel

    // MARK: - Data Properties

    let frameworkType: FrameworkType
    let isOnMock: Bool

    let themeMock = ThemeGeneratedMock.mocked()

    let colorsMock = SwitchColors.mocked()

    let imageMock = IconographyTests.shared.switchOn
    let imagesMock = SwitchUIImages(on: UIImage(), off: UIImage())

    let colorTokenMock = ColorTokenGeneratedMock.random()

    let positionMock = SwitchPosition.mocked()

    let toggleStateMock: SwitchToggleState

    // MARK: - Dependencies Properties

    let getColorsUseCaseMock: SwitchGetColorsUseCaseableGeneratedMock
    let getImagesStateUseCaseMock: SwitchGetImagesStateUseCaseableGeneratedMock
    let getToggleColorUseCaseMock: SwitchGetToggleColorUseCaseableGeneratedMock
    let getPositionUseCaseMock: SwitchGetPositionUseCaseableGeneratedMock
    let getToggleStateUseCaseMock: SwitchGetToggleStateUseCaseableGeneratedMock
    let displayedTextViewModelMock: DisplayedTextViewModelGeneratedMock

    let dependenciesMock: SwitchViewModelDependenciesProtocolGeneratedMock

    // MARK: - Publisher Properties

    let isOnChangedPublisherMock: PublisherMock<Published<Bool?>.Publisher>
    let isToggleInteractionEnabledPublisherMock: PublisherMock<Published<Bool?>.Publisher>
    let toggleOpacityPublisherMock: PublisherMock<Published<CGFloat?>.Publisher>
    let toggleBackgroundColorTokenPublisherMock: PublisherMock<Published<(any ColorToken)?>.Publisher>
    let toggleDotBackgroundColorTokenPublisherMock: PublisherMock<Published<(any ColorToken)?>.Publisher>
    let toggleDotForegroundColorTokenPublisherMock: PublisherMock<Published<(any ColorToken)?>.Publisher>
    let textForegroundColorTokenPublisherMock: PublisherMock<Published<(any ColorToken)?>.Publisher>
    let isToggleOnLeftPublisherMock: PublisherMock<Published<Bool?>.Publisher>
    let horizontalSpacingPublisherMock: PublisherMock<Published<CGFloat?>.Publisher>
    let showToggleLeftSpacePublisherMock: PublisherMock<Published<Bool?>.Publisher>
    let toggleDotImagesStatePublisherMock: PublisherMock<Published<SwitchImagesState?>.Publisher>
    let displayedTextPublisherMock: PublisherMock<Published<DisplayedText?>.Publisher>
    let textFontTokenPublisherMock: PublisherMock<Published<(any TypographyFontToken)?>.Publisher>

    // MARK: - Initialization

    init(
        frameworkType: FrameworkType = .uiKit,
        isOn: Bool = true,
        alignment: SwitchAlignment = .left,
        intent: SwitchIntent = .alert,
        isEnabled: Bool = true,
        isImages: Bool = false,
        text: String? = nil,
        attributedText: NSAttributedString? = nil,
        userInteractionEnabled: Bool = true
    ) {
        // Data properties
        self.frameworkType = frameworkType
        self.isOnMock = isOn

        let toggleStateMock = SwitchToggleState.mocked(
            interactionEnabled: userInteractionEnabled
        )
        self.toggleStateMock = toggleStateMock

        // **
        // Dependencies
        let getColorsUseCaseMock = SwitchGetColorsUseCaseableGeneratedMock()
        getColorsUseCaseMock.executeWithIntentAndColorsAndDimsReturnValue = self.colorsMock
        self.getColorsUseCaseMock = getColorsUseCaseMock

        let getImagesStateUseCaseMock = SwitchGetImagesStateUseCaseableGeneratedMock()
        getImagesStateUseCaseMock.executeWithIsOnAndImagesReturnValue = .mocked()
        self.getImagesStateUseCaseMock = getImagesStateUseCaseMock

        let getToggleColorUseCaseMock = SwitchGetToggleColorUseCaseableGeneratedMock()
        getToggleColorUseCaseMock.executeWithIsOnAndStatusAndStateColorReturnValue = self.colorTokenMock
        self.getToggleColorUseCaseMock = getToggleColorUseCaseMock

        let getPositionUseCaseMock = SwitchGetPositionUseCaseableGeneratedMock()
        getPositionUseCaseMock.executeWithAlignmentAndSpacingAndContainsTextReturnValue = self.positionMock
        self.getPositionUseCaseMock = getPositionUseCaseMock

        let getToggleStateUseCaseMock = SwitchGetToggleStateUseCaseableGeneratedMock()
        getToggleStateUseCaseMock.executeWithIsEnabledAndDimsReturnValue = toggleStateMock
        self.getToggleStateUseCaseMock = getToggleStateUseCaseMock

        let displayedTextViewModelMock = DisplayedTextViewModelGeneratedMock()
        displayedTextViewModelMock.underlyingDisplayedTextType = .text
        displayedTextViewModelMock.displayedText = .mocked()
        self.displayedTextViewModelMock = displayedTextViewModelMock

        let dependenciesMock = SwitchViewModelDependenciesProtocolGeneratedMock()
        dependenciesMock.underlyingGetColorsUseCase = self.getColorsUseCaseMock
        dependenciesMock.underlyingGetImagesStateUseCase = self.getImagesStateUseCaseMock
        dependenciesMock.underlyingGetToggleColorUseCase = self.getToggleColorUseCaseMock
        dependenciesMock.underlyingGetPositionUseCase = self.getPositionUseCaseMock
        dependenciesMock.underlyingGetToggleStateUseCase = self.getToggleStateUseCaseMock
        dependenciesMock.makeDisplayedTextViewModelWithTextAndAttributedTextReturnValue = self.displayedTextViewModelMock
        self.dependenciesMock = dependenciesMock
        // **

        // **
        // View Model
        let imagesEither: SwitchImagesEither?
        if isImages {
            imagesEither = .left(self.imagesMock)
        } else {
            imagesEither = nil
        }

        let attributedTextEither: AttributedStringEither?
        if let attributedText {
            attributedTextEither = .left(attributedText)
        } else {
            attributedTextEither = nil
        }

        let viewModel = SwitchViewModel(
            for: frameworkType,
            theme: self.themeMock,
            isOn: isOn,
            alignment: alignment,
            intent: intent,
            isEnabled: isEnabled,
            images: imagesEither,
            text: text,
            attributedText: attributedTextEither,
            dependencies: dependenciesMock
        )
        self.viewModel = viewModel
        // **

        // **
        // Publishers
        self.isOnChangedPublisherMock = .init(publisher: viewModel.$isOnChanged)
        self.isToggleInteractionEnabledPublisherMock = .init(publisher: viewModel.$isToggleInteractionEnabled)
        self.toggleOpacityPublisherMock = .init(publisher: viewModel.$toggleOpacity)
        self.toggleBackgroundColorTokenPublisherMock = .init(publisher: viewModel.$toggleBackgroundColorToken)
        self.toggleDotBackgroundColorTokenPublisherMock = .init(publisher: viewModel.$toggleDotBackgroundColorToken)
        self.toggleDotForegroundColorTokenPublisherMock = .init(publisher: viewModel.$toggleDotForegroundColorToken)
        self.textForegroundColorTokenPublisherMock = .init(publisher: viewModel.$textForegroundColorToken)
        self.isToggleOnLeftPublisherMock = .init(publisher: viewModel.$isToggleOnLeft)
        self.horizontalSpacingPublisherMock = .init(publisher: viewModel.$horizontalSpacing)
        self.showToggleLeftSpacePublisherMock = .init(publisher: viewModel.$showToggleLeftSpace)
        self.toggleDotImagesStatePublisherMock = .init(publisher: viewModel.$toggleDotImagesState)
        self.displayedTextPublisherMock = .init(publisher: viewModel.$displayedText)
        self.textFontTokenPublisherMock = .init(publisher: viewModel.$textFontToken)
        // **
    }

    func subscribePublishers(on subscriptions: inout Set<AnyCancellable>) {
        self.isOnChangedPublisherMock.loadTesting(on: &subscriptions)
        self.isToggleInteractionEnabledPublisherMock.loadTesting(on: &subscriptions)
        self.toggleOpacityPublisherMock.loadTesting(on: &subscriptions)
        self.toggleBackgroundColorTokenPublisherMock.loadTesting(on: &subscriptions)
        self.toggleDotBackgroundColorTokenPublisherMock.loadTesting(on: &subscriptions)
        self.toggleDotForegroundColorTokenPublisherMock.loadTesting(on: &subscriptions)
        self.textForegroundColorTokenPublisherMock.loadTesting(on: &subscriptions)
        self.isToggleOnLeftPublisherMock.loadTesting(on: &subscriptions)
        self.horizontalSpacingPublisherMock.loadTesting(on: &subscriptions)
        self.showToggleLeftSpacePublisherMock.loadTesting(on: &subscriptions)
        self.toggleDotImagesStatePublisherMock.loadTesting(on: &subscriptions)
        self.displayedTextPublisherMock.loadTesting(on: &subscriptions)
        self.textFontTokenPublisherMock.loadTesting(on: &subscriptions)
    }

    func resetMockedData() {
        // Clear UseCases Mock
        let useCases: [SparkComponentSwitchTesting.ResetGeneratedMock] = [
            self.getColorsUseCaseMock,
            self.getImagesStateUseCaseMock,
            self.getToggleColorUseCaseMock,
            self.getPositionUseCaseMock,
            self.getToggleStateUseCaseMock
        ]
        useCases.forEach { $0.reset() }

        // Reset published sink counter
        self.isOnChangedPublisherMock.reset()
        self.isToggleInteractionEnabledPublisherMock.reset()
        self.toggleOpacityPublisherMock.reset()
        self.toggleBackgroundColorTokenPublisherMock.reset()
        self.toggleDotBackgroundColorTokenPublisherMock.reset()
        self.toggleDotForegroundColorTokenPublisherMock.reset()
        self.textForegroundColorTokenPublisherMock.reset()
        self.isToggleOnLeftPublisherMock.reset()
        self.horizontalSpacingPublisherMock.reset()
        self.showToggleLeftSpacePublisherMock.reset()
        self.toggleDotImagesStatePublisherMock.reset()
        self.displayedTextPublisherMock.reset()
        self.textFontTokenPublisherMock.reset()
    }
}

// MARK: - Publisher Expectations

private func expectPublisherSinkCountEqual<T: Publisher>(
    on mock: PublisherMock<T>,
    _ expression: Int,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    #expect(mock.sinkCount == expression, "Wrong \(mock.name) sink count value", sourceLocation: sourceLocation)
}

private func expectPublisherSinkValueEqual<T: Publisher>(
    on mock: PublisherMock<T>,
    _ expression: T.Output,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) where T.Output: Equatable {
    #expect(mock.sinkValue == expression, "Wrong \(mock.name) sink value", sourceLocation: sourceLocation)
}

private func expectPublisherSinkValueIdentical<T: Publisher, Z: AnyObject>(
    on mock: PublisherMock<T>,
    _ expression: Z?,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    #expect(expression != nil, "\(Z.self) expression should be set", sourceLocation: sourceLocation)
    #expect((mock.sinkValue as? Z) === expression, "Wrong \(mock.name) sink value", sourceLocation: sourceLocation)
}

private func expectPublisherSinkValueNil<T: Publisher>(
    on mock: PublisherMock<T>,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    #expect(mock.sinkValue == nil, "Wrong \(mock.name) sink value nil", sourceLocation: sourceLocation)
}
