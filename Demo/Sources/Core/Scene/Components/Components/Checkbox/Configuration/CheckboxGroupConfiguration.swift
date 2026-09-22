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

    var intent: CheckboxIntent = .default
    var axis: CheckboxGroupAxis = .default

    var numberOfItems: Int = Int.random(in: 2...3) {
        didSet {
            self.updateItems()
        }
    }
    var items = [Item]()

    // MARK: - SwiftUI Properties Only

    var swiftUIIsCustomContent: Bool = false

    // MARK: - UIKit Properties Only

    var uiKitCanAnimated: Bool = false
    var uiKitIsAnimated: Bool = false

    // MARK: - Initialization

    required init() {
        super.init()

        self.updateItems()

        self.isEnabled.showConfiguration = true
        self.swiftUIWidth.showConfiguration = true

        self.uiKitControlType.showConfiguration = true
        self.uiKitControlType.cases = ComponentControlType.classic
        self.uiKitControlType.value = nil
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

    func getInfoValue(from selectedIDs: [Int]) -> String {
        if !selectedIDs.isEmpty {
            "SelectedIDs :" + selectedIDs.sorted().map { "\($0)" }.joined(separator: ", ")
        } else {
            "No selection"
        }
    }

    // MARK: - Methods

    override func random() {
        self.intent = .random
        self.axis = .random
    }
}

// MARK: - Sub Model

extension CheckboxGroupConfiguration {
    struct Item: Identifiable, Equatable {

        // MARK: - Properties

        let id: Int
        var isLongText: Bool = false
        var isAttributedText: Bool = false
        var isEnabled: Bool = true

        // MARK: - SwiftUI Properties Only

        var swiftUISecondText = "is amazing"

        // MARK: - UIKit Properties Only

        var uikitIsSelected = false

        // MARK: - Conversion

        func getText() -> String {
            return if self.isLongText {
                "Quisque viverra tincidunt diam sed eleifend. Phasellus malesuada vitae dui a pharetra. Aliquam sagittis tincidunt dolor, non aliquam quam vestibulum nec."
            } else {
                "My item \(self.id)"
            }
        }
    }
}
