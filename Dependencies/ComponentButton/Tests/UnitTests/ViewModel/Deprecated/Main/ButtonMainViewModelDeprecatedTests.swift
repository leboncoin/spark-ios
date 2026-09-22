//
//  ButtonMainViewModelDeprecatedTests.swift
//  SparkComponentButton
//
//  Created by janniklas.freundt.ext on 25.05.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentButton
@_spi(SI_SPI) @testable import SparkComponentButtonTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkThemingTesting
import SparkTheming
import SparkTheme
import Combine

final class ButtonMainViewModelDeprecatedTests: XCTestCase {

    // MARK: - Properties

    private var subscriptions = Set<AnyCancellable>()

    // MARK: - Setup

    override func tearDown() {
        super.tearDown()

        // Clear publishers
        self.subscriptions.removeAll()
    }

    // MARK: - Init Tests

    func test_init_when_frameworkType_is_UIKit() {
        self.testAllData(for: .initForUIKit)
    }

    func test_init_when_frameworkType_is_SwiftUI() {
        self.testAllData(for: .initForSwiftUI)
    }

    // MARK: - Load Tests

    func test_load() {
        self.testAllData(for: .load)
    }

    // MARK: - Actions Tests

    func test_pressedAction_when_viewModel_is_not_already_pressed_state() {
        self.testPressedAction(
            isPressedAction: true,
            isAlreadyOnPressedState: false
        )
    }

    func test_pressedAction_when_viewModel_is_already_pressed_state() {
        self.testPressedAction(
            isPressedAction: true,
            isAlreadyOnPressedState: true
        )
    }

    func test_unpressedAction_when_viewModel_is_not_already_unpressed_state() {
        self.testPressedAction(
            isPressedAction: false,
            isAlreadyOnPressedState: false
        )
    }

    func test_unpressedAction_when_viewModel_is_already_unpressed_state() {
        self.testPressedAction(
            isPressedAction: false,
            isAlreadyOnPressedState: true
        )
    }

    private func testPressedAction(
        isPressedAction: Bool,
        isAlreadyOnPressedState: Bool
    ) {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        stub.subscribePublishers(on: &self.subscriptions)

        viewModel.load()// Needed to get colors from usecase one time

        // Simulate action to toggle the isPressed value on viewModel
        if isPressedAction {
            if isAlreadyOnPressedState {
                viewModel.pressedAction(true)
            }
        } else {
            viewModel.pressedAction(!isAlreadyOnPressedState)
        }

        // Reset all dependencies mocked data
        stub.resetMockedData()

        // WHEN
        viewModel.pressedAction(isPressedAction)

        // THEN
        // **
        // Published properties
        ButtonMainViewModelDeprecatedPublisherTest.XCTSinksCount(
            state: stub.statePublisherMock,
            expectedNumberOfSinks: 0
        )
        ButtonMainViewModelDeprecatedPublisherTest.XCTAssert(
            colors: stub.colorsPublisherMock,
            expectedNumberOfSinks: !isAlreadyOnPressedState ? 1 : 0,
            expectedValue: stub.colorsMock
        )
        ButtonMainViewModelDeprecatedPublisherTest.XCTSinksCount(
            sizes: stub.sizesPublisherMock,
            expectedNumberOfSinks: 0
        )
        ButtonMainViewModelDeprecatedPublisherTest.XCTSinksCount(
            border: stub.borderPublisherMock,
            expectedNumberOfSinks: 0
        )
        // **

        // **
        // Use Cases
        ButtonGetBorderUseCaseableMockTest.XCTCallsCount(
            stub.getBorderUseCaseMock,
            executeWithThemeAndAppearanceAndIntentAndShapeAndVariantAndRemoveStylesNumberOfCalls: 0
        )
        ButtonGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: !isAlreadyOnPressedState ? 1 : 0,
            givenTheme: stub.themeMock,
            givenAppearance: nil,
            givenIntent: stub.viewModel.intent,
            givenVariant: stub.viewModel.variant,
            givenIsPressed: isPressedAction,
            expectedReturnValue: stub.colorsMock
        )
        ButtonGetSizesUseCaseableDeprecatedMockTest.XCTCallsCount(
            stub.getSizesUseCaseMock,
            executeWithSizeAndTypeNumberOfCalls: 0
        )
        ButtonGetStateUseCaseDeprecatedableMockTest.XCTCallsCount(
            stub.getStateUseCaseMock,
            executeWithIsEnabledAndDimsNumberOfCalls: 0
        )
        // **
    }

    // MARK: - Update All

    func test_updateAll() {
        self.testAllData(for: .updateAll)
    }

    // MARK: - Setter Tests

    func test_set_theme() {
        self.testAllData(for: .setTheme)
    }

    func test_set_intent_with_different_new_value() {
        self.testSetIntent(
            givenIsDifferentNewValue: true
        )
    }

    func test_set_intent_with_same_new_value() {
        self.testSetIntent(
            givenIsDifferentNewValue: false
        )
    }

    private func testSetIntent(
        givenIsDifferentNewValue: Bool
    ) {
        // GIVEN
        let defaultValue: ButtonIntent = .alert
        let newValue: ButtonIntent = givenIsDifferentNewValue ? .accent : defaultValue

        let variantMock: ButtonVariant = .outlined

        let stub = Stub(
            intent: defaultValue,
            variant: variantMock
        )
        let viewModel = stub.viewModel

        stub.subscribePublishers(on: &self.subscriptions)

        viewModel.load() // Needed to get colors from usecase one time

        // Reset all dependencies mocked data
        stub.resetMockedData()

        // WHEN
        viewModel.intent = newValue

        // THEN
        XCTAssertEqual(
            viewModel.intent,
            newValue,
            "Wrong intent value"
        )

        // **
        // Published properties
        ButtonMainViewModelDeprecatedPublisherTest.XCTSinksCount(
            state: stub.statePublisherMock,
            expectedNumberOfSinks: 0
        )
        ButtonMainViewModelDeprecatedPublisherTest.XCTAssert(
            colors: stub.colorsPublisherMock,
            expectedNumberOfSinks: givenIsDifferentNewValue ? 1 : 0,
            expectedValue: stub.colorsMock
        )
        ButtonMainViewModelDeprecatedPublisherTest.XCTSinksCount(
            sizes: stub.sizesPublisherMock,
            expectedNumberOfSinks: 0
        )
        ButtonMainViewModelDeprecatedPublisherTest.XCTSinksCount(
            border: stub.borderPublisherMock,
            expectedNumberOfSinks: 0
        )
        // **

        // **
        // Use Cases
        ButtonGetBorderUseCaseableMockTest.XCTCallsCount(
            stub.getBorderUseCaseMock,
            executeWithThemeAndAppearanceAndIntentAndShapeAndVariantAndRemoveStylesNumberOfCalls: 0
        )
        ButtonGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: givenIsDifferentNewValue ? 1 : 0,
            givenTheme: stub.themeMock,
            givenAppearance: nil,
            givenIntent: newValue,
            givenVariant: variantMock,
            givenIsPressed: false,
            expectedReturnValue: stub.colorsMock
        )
        ButtonGetSizesUseCaseableDeprecatedMockTest.XCTCallsCount(
            stub.getSizesUseCaseMock,
            executeWithSizeAndTypeNumberOfCalls: 0
        )
        ButtonGetStateUseCaseDeprecatedableMockTest.XCTCallsCount(
            stub.getStateUseCaseMock,
            executeWithIsEnabledAndDimsNumberOfCalls: 0
        )
        // **
    }

    func test_set_variant_with_different_new_value() {
        self.testSetVariant(
            givenIsDifferentNewValue: true
        )
    }

    func test_set_variant_with_same_new_value() {
        self.testSetVariant(
            givenIsDifferentNewValue: false
        )
    }

    private func testSetVariant(
        givenIsDifferentNewValue: Bool
    ) {
        // GIVEN
        let defaultValue: ButtonVariant = .contrast
        let newValue: ButtonVariant = givenIsDifferentNewValue ? .outlined : defaultValue

        let intentMock: ButtonIntent = .success

        let stub = Stub(
            intent: intentMock,
            variant: defaultValue
        )
        let viewModel = stub.viewModel

        stub.subscribePublishers(on: &self.subscriptions)

        viewModel.load() // Needed to get colors from usecase one time

        // Reset all dependencies mocked data
        stub.resetMockedData()

        // WHEN
        viewModel.variant = newValue

        // THEN
        XCTAssertEqual(
            viewModel.variant,
            newValue,
            "Wrong variant value"
        )

        // **
        // Published properties
        ButtonMainViewModelDeprecatedPublisherTest.XCTSinksCount(
            state: stub.statePublisherMock,
            expectedNumberOfSinks: 0
        )
        ButtonMainViewModelDeprecatedPublisherTest.XCTAssert(
            colors: stub.colorsPublisherMock,
            expectedNumberOfSinks: givenIsDifferentNewValue ? 1 : 0,
            expectedValue: stub.colorsMock
        )
        ButtonMainViewModelDeprecatedPublisherTest.XCTSinksCount(
            sizes: stub.sizesPublisherMock,
            expectedNumberOfSinks: 0
        )
        ButtonMainViewModelDeprecatedPublisherTest.XCTAssert(
            border: stub.borderPublisherMock,
            expectedNumberOfSinks: givenIsDifferentNewValue ? 1 : 0,
            expectedValue: stub.borderMock
        )
        // **

        // **
        // Use Cases
        ButtonGetBorderUseCaseableMockTest.XCTAssert(
            stub.getBorderUseCaseMock,
            expectedNumberOfCalls: givenIsDifferentNewValue ? 1 : 0,
            givenTheme: stub.themeMock,
            givenAppearance: nil,
            givenIntent: intentMock,
            givenShape: stub.shapeMock,
            givenVariant: newValue,
            givenRemoveStyles: false,
            expectedReturnValue: stub.borderMock
        )
        ButtonGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: givenIsDifferentNewValue ? 1 : 0,
            givenTheme: stub.themeMock,
            givenAppearance: nil,
            givenIntent: intentMock,
            givenVariant: newValue,
            givenIsPressed: false,
            expectedReturnValue: stub.colorsMock
        )
        ButtonGetSizesUseCaseableDeprecatedMockTest.XCTCallsCount(
            stub.getSizesUseCaseMock,
            executeWithSizeAndTypeNumberOfCalls: 0
        )
        ButtonGetStateUseCaseDeprecatedableMockTest.XCTCallsCount(
            stub.getStateUseCaseMock,
            executeWithIsEnabledAndDimsNumberOfCalls: 0
        )
        // **
    }

    func test_set_size_with_different_new_value() {
        self.testSetSize(
            givenIsDifferentNewValue: true
        )
    }

    func test_set_size_with_same_new_value() {
        self.testSetSize(
            givenIsDifferentNewValue: false
        )
    }

    private func testSetSize(
        givenIsDifferentNewValue: Bool
    ) {
        // GIVEN
        let defaultValue: ButtonSize = .large
        let newValue: ButtonSize = givenIsDifferentNewValue ? .small : defaultValue

        let typeMock: ButtonType = .button

        let stub = Stub(
            type: typeMock,
            size: defaultValue
        )
        let viewModel = stub.viewModel

        stub.subscribePublishers(on: &self.subscriptions)

        viewModel.load() // Needed to get colors from usecase one time

        // Reset all dependencies mocked data
        stub.resetMockedData()

        // WHEN
        viewModel.size = newValue

        // THEN
        XCTAssertEqual(
            viewModel.size,
            newValue,
            "Wrong size value"
        )

        // **
        // Published properties
        ButtonMainViewModelDeprecatedPublisherTest.XCTSinksCount(
            state: stub.statePublisherMock,
            expectedNumberOfSinks: 0
        )
        ButtonMainViewModelDeprecatedPublisherTest.XCTSinksCount(
            colors: stub.colorsPublisherMock,
            expectedNumberOfSinks: 0
        )
        ButtonMainViewModelDeprecatedPublisherTest.XCTAssert(
            sizes: stub.sizesPublisherMock,
            expectedNumberOfSinks: givenIsDifferentNewValue ? 1 : 0,
            expectedValue: stub.sizesMock
        )
        ButtonMainViewModelDeprecatedPublisherTest.XCTSinksCount(
            border: stub.borderPublisherMock,
            expectedNumberOfSinks: 0
        )
        // **

        // **
        // Use Cases
        ButtonGetBorderUseCaseableMockTest.XCTCallsCount(
            stub.getBorderUseCaseMock,
            executeWithThemeAndAppearanceAndIntentAndShapeAndVariantAndRemoveStylesNumberOfCalls: 0
        )
        ButtonGetColorsUseCaseableMockTest.XCTCallsCount(
            stub.getColorsUseCaseMock,
            executeWithThemeAndAppearanceAndIntentAndVariantAndIsPressedNumberOfCalls: 0
        )
        ButtonGetSizesUseCaseableDeprecatedMockTest.XCTAssert(
            stub.getSizesUseCaseMock,
            expectedNumberOfCalls: givenIsDifferentNewValue ? 1 : 0,
            givenSize: newValue,
            givenType: typeMock,
            expectedReturnValue: stub.sizesMock
        )
        ButtonGetStateUseCaseDeprecatedableMockTest.XCTCallsCount(
            stub.getStateUseCaseMock,
            executeWithIsEnabledAndDimsNumberOfCalls: 0
        )
        // **
    }

    func test_set_isEnabled_with_different_new_value() {
        self.testSetIsEnabled(
            givenIsDifferentNewValue: true
        )
    }

    func test_set_isEnabled_with_same_new_value() {
        self.testSetIsEnabled(
            givenIsDifferentNewValue: false
        )
    }

    private func testSetIsEnabled(
        givenIsDifferentNewValue: Bool
    ) {
        // GIVEN
        let defaultValue: Bool = true
        let newValue: Bool = givenIsDifferentNewValue ? false : defaultValue

        let stub = Stub()
        let viewModel = stub.viewModel

        stub.subscribePublishers(on: &self.subscriptions)

        viewModel.load() // Needed to get colors from usecase one time

        // Reset all dependencies mocked data
        stub.resetMockedData()

        // WHEN
        viewModel.isEnabled = newValue

        // THEN
        XCTAssertEqual(
            viewModel.isEnabled,
            newValue,
            "Wrong isEnabled value"
        )

        // **
        // Published properties
        ButtonMainViewModelDeprecatedPublisherTest.XCTAssert(
            state: stub.statePublisherMock,
            expectedNumberOfSinks: givenIsDifferentNewValue ? 1 : 0,
            expectedValue: stub.stateMock
        )
        ButtonMainViewModelDeprecatedPublisherTest.XCTSinksCount(
            colors: stub.colorsPublisherMock,
            expectedNumberOfSinks: 0
        )
        ButtonMainViewModelDeprecatedPublisherTest.XCTSinksCount(
            sizes: stub.sizesPublisherMock,
            expectedNumberOfSinks: 0
        )
        ButtonMainViewModelDeprecatedPublisherTest.XCTSinksCount(
            border: stub.borderPublisherMock,
            expectedNumberOfSinks: 0
        )
        // **

        // **
        // Use Cases
        ButtonGetBorderUseCaseableMockTest.XCTCallsCount(
            stub.getBorderUseCaseMock,
            executeWithThemeAndAppearanceAndIntentAndShapeAndVariantAndRemoveStylesNumberOfCalls: 0
        )
        ButtonGetColorsUseCaseableMockTest.XCTCallsCount(
            stub.getColorsUseCaseMock,
            executeWithThemeAndAppearanceAndIntentAndVariantAndIsPressedNumberOfCalls: 0
        )
        ButtonGetSizesUseCaseableDeprecatedMockTest.XCTCallsCount(
            stub.getSizesUseCaseMock,
            executeWithSizeAndTypeNumberOfCalls: 0
        )
        ButtonGetStateUseCaseDeprecatedableMockTest.XCTAssert(
            stub.getStateUseCaseMock,
            expectedNumberOfCalls: givenIsDifferentNewValue ? 1 : 0,
            givenIsEnabled: newValue,
            givenDims: stub.themeMock.dims as? DimsGeneratedMock,
            expectedReturnValue: stub.stateMock
        )
        // **
    }

    func test_set_appearance_with_different_new_value() {
        self.testSetAppearance(
            givenIsDifferentNewValue: true
        )
    }

    func test_set_appearance_with_same_new_value() {
        self.testSetAppearance(
            givenIsDifferentNewValue: false
        )
    }

    private func testSetAppearance(
        givenIsDifferentNewValue: Bool
    ) {
        // GIVEN
        let defaultValue: ButtonAppearance? = .primary
        let newValue: ButtonAppearance? = givenIsDifferentNewValue ? .secondary : defaultValue

        let intentMock: ButtonIntent = .main
        let variantMock: ButtonVariant = .filled

        let stub = Stub(
            intent: intentMock,
            variant: variantMock
        )
        let viewModel = stub.viewModel

        viewModel.appearance = defaultValue

        stub.subscribePublishers(on: &self.subscriptions)

        viewModel.load() // Needed to get colors from usecase one time

        // Reset all dependencies mocked data
        stub.resetMockedData()

        // WHEN
        viewModel.appearance = newValue

        // THEN
        XCTAssertEqual(
            viewModel.appearance,
            newValue,
            "Wrong appearance value"
        )

        // **
        // Published properties
        ButtonMainViewModelDeprecatedPublisherTest.XCTSinksCount(
            state: stub.statePublisherMock,
            expectedNumberOfSinks: 0
        )
        ButtonMainViewModelDeprecatedPublisherTest.XCTAssert(
            colors: stub.colorsPublisherMock,
            expectedNumberOfSinks: givenIsDifferentNewValue ? 1 : 0,
            expectedValue: stub.colorsMock
        )
        ButtonMainViewModelDeprecatedPublisherTest.XCTSinksCount(
            sizes: stub.sizesPublisherMock,
            expectedNumberOfSinks: 0
        )
        ButtonMainViewModelDeprecatedPublisherTest.XCTAssert(
            border: stub.borderPublisherMock,
            expectedNumberOfSinks: givenIsDifferentNewValue ? 1 : 0,
            expectedValue: stub.borderMock
        )
        // **

        // **
        // Use Cases
        ButtonGetBorderUseCaseableMockTest.XCTAssert(
            stub.getBorderUseCaseMock,
            expectedNumberOfCalls: givenIsDifferentNewValue ? 1 : 0,
            givenTheme: stub.themeMock,
            givenAppearance: newValue,
            givenIntent: intentMock,
            givenShape: stub.shapeMock,
            givenVariant: variantMock,
            givenRemoveStyles: false,
            expectedReturnValue: stub.borderMock
        )
        ButtonGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: givenIsDifferentNewValue ? 1 : 0,
            givenTheme: stub.themeMock,
            givenAppearance: newValue,
            givenIntent: intentMock,
            givenVariant: variantMock,
            givenIsPressed: false,
            expectedReturnValue: stub.colorsMock
        )
        ButtonGetSizesUseCaseableDeprecatedMockTest.XCTCallsCount(
            stub.getSizesUseCaseMock,
            executeWithSizeAndTypeNumberOfCalls: 0
        )
        ButtonGetStateUseCaseDeprecatedableMockTest.XCTCallsCount(
            stub.getStateUseCaseMock,
            executeWithIsEnabledAndDimsNumberOfCalls: 0
        )
        // **
    }

    // MARK: - All Data

    private func testAllData(for testAllDataType: TestAllDataType) {
        // GIVEN
        let typeMock: ButtonType = .button
        let intentMock: ButtonIntent = .success
        let variantMock: ButtonVariant = .outlined
        let shapeMock: ButtonShape = .pill
        let sizeMock: ButtonSize = .large

        let stub = Stub(
            for: testAllDataType.frameworkType,
            type: typeMock,
            intent: intentMock,
            variant: variantMock,
            size: sizeMock
        )
        let viewModel = stub.viewModel

        let themeMock = (testAllDataType == .setTheme) ? ThemeGeneratedMock.mocked() : stub.themeMock

        stub.subscribePublishers(on: &self.subscriptions)

        // WHEN
        if testAllDataType.callResetMockedDataBeforeLoad {
            stub.resetMockedData()
        }

        if testAllDataType.callLoad {
            viewModel.load()
        }

        if testAllDataType.callResetMockedDataAfterLoad {
            stub.resetMockedData()
        }

        switch testAllDataType {
        case .updateAll:
            viewModel.updateAll()
        case .setTheme:
            viewModel.theme = themeMock
        default:
            break
        }

        // THEN
        XCTAssertIdentical(
            viewModel.theme as? ThemeGeneratedMock,
            themeMock,
            "Wrong theme value"
        )
        XCTAssertEqual(
            viewModel.intent,
            intentMock,
            "Wrong intent value"
        )
        XCTAssertEqual(
            viewModel.variant,
            variantMock,
            "Wrong variant value"
        )
        XCTAssertEqual(
            viewModel.size,
            sizeMock,
            "Wrong size value"
        )
        XCTAssertEqual(
            viewModel.isEnabled,
            true,
            "Wrong default isEnabled value"
        )

        // **
        // Published properties
        ButtonMainViewModelDeprecatedPublisherTest.XCTAssert(
            state: stub.statePublisherMock,
            expectedNumberOfSinks: testAllDataType.expectedCalledPropertiesAndUseCases ? 1 : 0,
            expectedValue: stub.stateMock
        )
        ButtonMainViewModelDeprecatedPublisherTest.XCTAssert(
            colors: stub.colorsPublisherMock,
            expectedNumberOfSinks: testAllDataType.expectedCalledPropertiesAndUseCases ? 1 : 0,
            expectedValue: stub.colorsMock
        )
        ButtonMainViewModelDeprecatedPublisherTest.XCTAssert(
            sizes: stub.sizesPublisherMock,
            expectedNumberOfSinks: testAllDataType.expectedCalledPropertiesAndUseCases ? 1 : 0,
            expectedValue: stub.sizesMock
        )
        ButtonMainViewModelDeprecatedPublisherTest.XCTAssert(
            border: stub.borderPublisherMock,
            expectedNumberOfSinks: testAllDataType.expectedCalledPropertiesAndUseCases ? 1 : 0,
            expectedValue: stub.borderMock
        )
        // **

        // **
        // Use Cases
        ButtonGetBorderUseCaseableMockTest.XCTAssert(
            stub.getBorderUseCaseMock,
            expectedNumberOfCalls: testAllDataType.expectedCalledPropertiesAndUseCases ? 1 : 0,
            givenTheme: themeMock,
            givenAppearance: nil,
            givenIntent: intentMock,
            givenShape: shapeMock,
            givenVariant: variantMock,
            givenRemoveStyles: false,
            expectedReturnValue: stub.borderMock
        )
        ButtonGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: testAllDataType.expectedCalledPropertiesAndUseCases ? 1 : 0,
            givenTheme: themeMock,
            givenAppearance: nil,
            givenIntent: intentMock,
            givenVariant: variantMock,
            givenIsPressed: false,
            expectedReturnValue: stub.colorsMock
        )
        ButtonGetSizesUseCaseableDeprecatedMockTest.XCTAssert(
            stub.getSizesUseCaseMock,
            expectedNumberOfCalls: testAllDataType.expectedCalledPropertiesAndUseCases ? 1 : 0,
            givenSize: sizeMock,
            givenType: typeMock,
            expectedReturnValue: stub.sizesMock
        )
        ButtonGetStateUseCaseDeprecatedableMockTest.XCTAssert(
            stub.getStateUseCaseMock,
            expectedNumberOfCalls: testAllDataType.expectedCalledPropertiesAndUseCases ? 1 : 0,
            givenIsEnabled: true,
            givenDims: themeMock.dims as? DimsGeneratedMock,
            expectedReturnValue: stub.stateMock
        )
        // **
    }
}

// MARK: - Stub

private final class Stub: ButtonMainViewModelDeprecatedStub {

    // MARK: - Data Properties

    let themeMock = ThemeGeneratedMock.mocked()

    let shapeMock: ButtonShape = .pill

    let borderMock = ButtonBorder.mocked()
    let colorsMock = ButtonColors(
        tintColor: ColorTokenGeneratedMock.blue(),
        iconColor: ColorTokenGeneratedMock.red(),
        backgroundColor: ColorTokenGeneratedMock.yellow(),
        borderColor: ColorTokenGeneratedMock.purple()
    )
    let sizesMock = ButtonSizes.mocked()
    let stateMock = ButtonStateDeprecated.mocked()

    // MARK: - Initialization

    init(
        for frameworkType: FrameworkType = .uiKit,
        type: ButtonType = .button,
        intent: ButtonIntent = .main,
        variant: ButtonVariant = .tinted,
        size: ButtonSize = .medium
    ) {
        // **
        // Use Cases
        let getBorderUseCaseMock = ButtonGetBorderUseCaseableGeneratedMock()
        getBorderUseCaseMock.executeWithThemeAndAppearanceAndIntentAndShapeAndVariantAndRemoveStylesReturnValue = self.borderMock

        let getColorsUseCaseMock = ButtonGetColorsUseCaseableGeneratedMock()
        getColorsUseCaseMock.executeWithThemeAndAppearanceAndIntentAndVariantAndIsPressedReturnValue = self.colorsMock

        let getSizesUseCaseMock = ButtonGetSizesUseCaseableDeprecatedGeneratedMock()
        getSizesUseCaseMock.executeWithSizeAndTypeReturnValue = self.sizesMock

        let getStateUseCaseMock = ButtonGetStateUseCaseDeprecatedableGeneratedMock()
        getStateUseCaseMock.executeWithIsEnabledAndDimsReturnValue = self.stateMock
        // **

        let viewModel = ButtonMainViewModelDeprecated(
            for: frameworkType,
            type: .button,
            theme: self.themeMock,
            appearance: nil,
            intent: intent,
            variant: variant,
            shape: self.shapeMock,
            size: size,
            getBorderUseCase: getBorderUseCaseMock,
            getColorsUseCase: getColorsUseCaseMock,
            getSizesUseCase: getSizesUseCaseMock,
            getStateUseCase: getStateUseCaseMock
        )

        super.init(
            viewModel: viewModel,
            getBorderUseCaseMock: getBorderUseCaseMock,
            getColorsUseCaseMock: getColorsUseCaseMock,
            getSizesUseCaseMock: getSizesUseCaseMock,
            getStateUseCaseMock: getStateUseCaseMock
        )
    }
}

// MARK: - Enum

private enum TestAllDataType {
    case initForSwiftUI
    case initForUIKit
    case load
    case updateAll
    case setTheme

    // MARK: - Properties

    var frameworkType: FrameworkType {
        switch self {
        case .initForSwiftUI:
            return .swiftUI
        default:
            return .uiKit
        }
    }

    var callLoad: Bool {
        switch self {
        case .initForUIKit, .load:
            return true
        default:
            return false
        }
    }

    var callResetMockedDataBeforeLoad: Bool {
        switch self {
        case .load:
            return true
        default:
            return false
        }
    }

    var callResetMockedDataAfterLoad: Bool {
        switch self {
        case .initForSwiftUI, .load:
            return false
        default:
            return true
        }
    }

    var expectedCalledPropertiesAndUseCases: Bool {
        switch self {
        case .initForUIKit:
            return false
        default:
            return true
        }
    }
}
