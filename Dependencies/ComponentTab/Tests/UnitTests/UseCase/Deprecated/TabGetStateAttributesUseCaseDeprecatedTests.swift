//
//  TabGetStateAttributesUseCaseTests.swift
//  SparkComponentTabTests
//
//  Created by alican.aycil on 21.07.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

@testable import SparkComponentTab
@_spi(SI_SPI) @testable import SparkComponentTabTesting
import XCTest
@_spi(SI_SPI) import SparkThemingTesting
import SparkTheming

final class TabGetStateAttributesUseCaseTests: XCTestCase {

    // MARK: - Private properties
    private var sut: TabGetStateAttributesUseCaseDeprecated!
    private var theme: ThemeGeneratedMock!
    private var getIntentColorUseCase: TabGetIntentColorUseCasebleDeprecatedGeneratedMock!
    private var getFontUseCase: TabGetFontUseCaseableDeprecatedGeneratedMock!
    private var spacings: TabItemSpacingsDeprecated!
    private var colors: TabItemColorsDeprecated!

    // MARK: - Setup
    override func setUp() {
        super.setUp()
        self.theme = ThemeGeneratedMock.mocked()
        self.getIntentColorUseCase = TabGetIntentColorUseCasebleDeprecatedGeneratedMock()
        self.getFontUseCase = TabGetFontUseCaseableDeprecatedGeneratedMock()

        self.sut = TabGetStateAttributesUseCaseDeprecated(
            getIntentColorUseCase: getIntentColorUseCase,
            getTabFontUseCase: getFontUseCase
        )
        self.spacings = TabItemSpacingsDeprecated(
            verticalEdge: self.theme.layout.spacing.medium,
            horizontalEdge: self.theme.layout.spacing.large,
            content: self.theme.layout.spacing.medium
        )
        self.colors = TabItemColorsDeprecated(
            label: self.theme.colors.base.onSurface,
            line: self.theme.colors.base.outline,
            background: ColorTokenDefault.clear
        )

        self.getFontUseCase.executeWithTypographyAndSizeReturnValue = self.theme.typography.body2
    }

    // MARK: - Tests
    func test_selected() {
        let mockedColor = ColorTokenGeneratedMock(uiColor: .black)
        self.getIntentColorUseCase.executeWithColorsAndIntentReturnValue = mockedColor
        let stateAttribute = sut.execute(
            theme: self.theme,
            intent: .main,
            state: .selected,
            tabSize: .md,
            hasTitle: true
        )
        let selectedColors = TabItemColorsDeprecated(
            label: mockedColor,
            line: mockedColor,
            background: ColorTokenDefault.clear
        )
        let expectedHeights = TabItemHeightsDeprecated(
            separatorLineHeight: self.theme.border.width.medium,
            itemHeight: 40,
            iconHeight: 16
        )

        let expectedAttribute = TabStateAttributesDeprecated(
            spacings: self.spacings,
            colors: selectedColors,
            heights: expectedHeights,
            font: self.theme.typography.body1
        )
        XCTAssertEqual(stateAttribute, expectedAttribute)
    }

    func test_enabled() {
        let stateAttribute = sut.execute(
            theme: self.theme,
            intent: .main,
            state: .enabled,
            tabSize: .md,
            hasTitle: true
        )

        let expectedHeights = TabItemHeightsDeprecated(
            separatorLineHeight: self.theme.border.width.small,
            itemHeight: 40,
            iconHeight: 16
        )

        let expectedAttribute = TabStateAttributesDeprecated(
            spacings: self.spacings,
            colors: self.colors,
            heights: expectedHeights,
            font: self.theme.typography.body1
        )
        XCTAssertEqual(stateAttribute, expectedAttribute)
    }

    func test_pressed() {
        let stateAttribute = sut.execute(
            theme: self.theme,
            intent: .main,
            state: .pressed,
            tabSize: .sm,
            hasTitle: true
        )

        self.colors = TabItemColorsDeprecated(
            label: self.theme.colors.base.onSurface.opacity(self.theme.dims.dim1),
            line: self.theme.colors.base.outline,
            background: self.theme.colors.states.surfacePressed
        )

        let expectedHeights = TabItemHeightsDeprecated(
            separatorLineHeight: self.theme.border.width.small,
            itemHeight: 36,
            iconHeight: 14
        )

        let expectedAttribute = TabStateAttributesDeprecated(
            spacings: self.spacings,
            colors: self.colors,
            heights: expectedHeights,
            font: self.theme.typography.body1
        )
        XCTAssertEqual(stateAttribute, expectedAttribute)
    }

    func test_disabled() {
        let stateAttribute = sut.execute(
            theme: self.theme,
            intent: .main,
            state: .disabled,
            tabSize: .xs,
            hasTitle: true
        )

        let expectedHeights = TabItemHeightsDeprecated(
            separatorLineHeight: self.theme.border.width.small,
            itemHeight: 34,
            iconHeight: 12
        )

        let expectedAttribute = TabStateAttributesDeprecated(
            spacings: self.spacings,
            colors: self.colors.update(\.opacity, value: theme.dims.dim3),
            heights: expectedHeights,
            font: self.theme.typography.body1
        )
        XCTAssertEqual(stateAttribute, expectedAttribute)
    }

    func test_no_title() {
        let stateAttribute = sut.execute(
            theme: self.theme,
            intent: .main,
            state: .disabled,
            tabSize: .xs,
            hasTitle: false
        )

        let expectedHeights = TabItemHeightsDeprecated(
            separatorLineHeight: self.theme.border.width.small,
            itemHeight: 40,
            iconHeight: 16
        )

        let expectedAttribute = TabStateAttributesDeprecated(
            spacings: self.spacings,
            colors: self.colors.update(\.opacity, value: theme.dims.dim3),
            heights: expectedHeights,
            font: self.theme.typography.body1
        )
        XCTAssertEqual(stateAttribute, expectedAttribute)
    }
}

private extension TabStateDeprecated {
    static var enabled: TabStateDeprecated {
        return .init()
    }

    static var selected: TabStateDeprecated {
        return .init(isSelected: true)
    }

    static var pressed: TabStateDeprecated {
        return .init(isPressed: true)
    }

    static var disabled: TabStateDeprecated {
        return .init(isEnabled: false)
    }
}
