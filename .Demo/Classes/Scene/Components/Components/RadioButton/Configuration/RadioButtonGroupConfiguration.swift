//
//  RadioButtonGroupConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 29/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

class RadioButtonGroupConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var intent: RadioButtonIntent = .random
    var labelAlignment: RadioButtonLabelAlignment = .random
    var groupLayout: RadioButtonGroupLayout = .random
    var numberOfItems: Int = Int.random(in: 2...3) {
        didSet {
            self.updateItems()

            if self.uiKitSelectedId > self.numberOfItems {
                self.uiKitSelectedId = -1
            }
        }
    }
    var items = [Item]()

    // MARK: - UIKit Properties Only

    var uiKitSelectedId: Int = Bool.random() ? 0 : -1

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

    func getInfoValue(from selectedId: Int?) -> String {
        if let selectedId {
            "SelectedID: \(selectedId)"
        } else {
            "No selection"
        }
    }
}

// MARK: - Sub Model

extension RadioButtonGroupConfiguration {
    struct Item: Identifiable {

        // MARK: - Properties

        let id: Int
        var isLongText: Bool = .random()
        var isAttributedText: Bool = .random()

        // MARK: - Initialization

        init(id: Int) {
            self.id = id
        }

        // MARK: - Getter

        func getText() -> String {
            return if self.isLongText {
                "Quisque viverra tincidunt diam sed eleifend. Phasellus malesuada vitae dui a pharetra. Aliquam sagittis tincidunt dolor, non aliquam quam vestibulum nec."
            } else {
                "My item \(self.id)"
            }
        }
    }
}

// MARK: - Extension

extension RadioButtonGroupLayout: @retroactive CaseIterable {

    public static var allCases: [RadioButtonGroupLayout] = [
        .horizontal,
        .vertical
    ]
}
