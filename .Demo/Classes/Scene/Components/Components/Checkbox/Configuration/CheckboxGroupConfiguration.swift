//
//  CheckboxGroupConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 30/01/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import Foundation

class CheckboxGroupConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var intent: CheckboxIntent = .random
    var alignment: CheckboxAlignment = .random
    var layout: CheckboxGroupLayout = .horizontal
    var checkedIcon: Iconography = .random

    var numberOfItems: Int = Int.random(in: 2...3) {
        didSet {
            self.updateItems()
        }
    }
    var items = [Item]()

    // MARK: - Initialization

    required init() {
        super.init()

        self.updateItems()

        self.isEnabled.showConfiguration = true
    }

    // MARK: - Update

    func updateItems() {
        let lastNumberOfItems = self.items.count
        if self.numberOfItems > lastNumberOfItems {
            repeat {
                self.items.append(Item(id: self.items.count + 1))
            } while self.numberOfItems > self.items.count
        } else if self.numberOfItems < lastNumberOfItems {
            self.items.removeLast()
        }
    }
}

// MARK: - Sub Model

extension CheckboxGroupConfiguration {
    struct Item: Identifiable, Equatable {

        // MARK: - Properties

        let id: Int
        var isLongText: Bool = .random()
        var isAttributedText: Bool = .random()
        var isEnabled: Bool = .random()
        var selectionState: CheckboxSelectionState = .random

        // MARK: - Conversion

        func toSpark(for framework: Framework) -> CheckboxGroupItemDefault {
            let attributedTitleCondition = (framework.isUIKit && self.isAttributedText)

            let text = if !self.isLongText {
                "My item \(self.id)"
            } else {
                "Quisque viverra tincidunt diam sed eleifend. Phasellus malesuada vitae dui a pharetra. Aliquam sagittis tincidunt dolor, non aliquam quam vestibulum nec."
            }

            return CheckboxGroupItemDefault(
                title: attributedTitleCondition ? nil : text,
                attributedTitle: attributedTitleCondition ? NSAttributedString(text.demoAttributedString) : nil,
                id: String(self.id),
                selectionState: self.selectionState,
                isEnabled: self.isEnabled
            )
        }
    }
}

// MARK: - Extension

extension CheckboxGroupLayout: @retroactive CaseIterable {

    public static var allCases: [CheckboxGroupLayout] = [
        .vertical,
        .horizontal
    ]
}
