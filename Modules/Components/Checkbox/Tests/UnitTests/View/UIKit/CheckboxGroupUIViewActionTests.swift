//
//  CheckboxGroupUIViewActionTests.swift
//  SparkComponentCheckboxTests
//
//  Created by michael.zimmermann on 14.07.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Combine
import Testing
@testable import SparkComponentCheckbox
@_spi(SI_SPI) @testable import SparkComponentCheckboxTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonTesting
@_spi(SI_SPI) import SparkThemingTesting
import SparkTheming
import SparkTheme

@Suite("Checkbox Group UIView Action Tests")
@MainActor
struct CheckboxGroupUIViewActionTests {

    // MARK: - Private Properties

    private let theme: any Theme
    // swiftlint:disable weak_delegate
    private let delegate: CheckboxGroupUIViewDelegateGeneratedMock
    private let items: [any CheckboxGroupItemProtocol] = [
        CheckboxGroupItemDefault(title: "Apple", id: "1", selectionState: .selected, isEnabled: true),
        CheckboxGroupItemDefault(title: "Cake", id: "2", selectionState: .indeterminate, isEnabled: true),
        CheckboxGroupItemDefault(title: "Fish", id: "3", selectionState: .unselected, isEnabled: true),
        CheckboxGroupItemDefault(title: "Fruit", id: "4", selectionState: .unselected, isEnabled: true),
        CheckboxGroupItemDefault(title: "Vegetables", id: "5", selectionState: .selected, isEnabled: false)
    ]

    // MARK: - Setup

    init() {
        SparkConfiguration.load()
        self.theme = SparkTheme.shared
        self.delegate = .init()
    }

    // MARK: - Tests

    @Test("Touch up inside on a checkbox item should publish and call the delegate")
    func actionFromCheckboxItemTouchUpInside() async {
        let sut = self.sut()
        var subscriptions = Set<AnyCancellable>()

        var selectionState: CheckboxSelectionState = .indeterminate

        await confirmation("Checkbox change should be published") { confirm in
            sut.publisher.sink(receiveValue: { items in
                selectionState = items[0].selectionState
                confirm()
            })
            .store(in: &subscriptions)

            sut.checkboxes[0].sendActions(for: .touchUpInside)
        }

        #expect(selectionState == .unselected)
        #expect(self.delegate.checkboxGroupWithCheckboxGroupAndStatesCallsCount == 1)
        #expect(self.delegate.checkboxGroupWithCheckboxGroupAndStatesReceivedArguments?.states[0].selectionState == .unselected)
    }

    // MARK: - Private Functions

    private func sut() -> CheckboxGroupUIView {
        let sut = CheckboxGroupUIView(
            checkedImage: IconographyTests.shared.checkmark,
            items: self.items,
            alignment: .left,
            theme: self.theme,
            accessibilityIdentifierPrefix: "XX"
        )

        sut.delegate = self.delegate
        return sut
    }
}
