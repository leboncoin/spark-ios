//
//  CheckboxGroupConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 30/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

class CheckboxGroupConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var intent: CheckboxIntent = .random
    var alignment: CheckboxAlignment = .random
    var layout: CheckboxGroupLayout = .horizontal
    var title = "My Title Group"
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

    // MARK: - Getter

    func getInfoValue(from selections: [CheckboxSelectionState]) -> String {
        let texts: [String] = selections.enumerated().map { index, selection in
            return "\(index + 1) \(selection)"
            }
        return texts.joined(separator: " | ")
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
            let isAttributedTitleCondition = (framework.isUIKit && self.isAttributedText)

            let text = if self.isLongText {
                "Quisque viverra tincidunt diam sed eleifend. Phasellus malesuada vitae dui a pharetra. Aliquam sagittis tincidunt dolor, non aliquam quam vestibulum nec."
            } else {
                "My item \(self.id)"
            }

            return CheckboxGroupItemDefault(
                title: isAttributedTitleCondition ? nil : text,
                attributedTitle: isAttributedTitleCondition ? text.demoNSAttributedString : nil,
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
