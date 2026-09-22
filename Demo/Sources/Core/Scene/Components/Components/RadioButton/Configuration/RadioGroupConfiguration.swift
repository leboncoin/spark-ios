//
//  RadioGroupConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 29/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

class RadioGroupConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var intent: RadioButtonIntent = .default
    var axis: RadioGroupAxis = .default
    var numberOfItems: Int = Int.random(in: 2...3) {
        didSet {
            self.updateItems()

            if self.uiKitSelectedId > self.numberOfItems {
                self.uiKitSelectedId = -1
            }
        }
    }
    var items = [Item]()
    var isAnimated: Bool = true

    // MARK: - SwiftUI Properties Only

    var swiftUIIsCustomContent: Bool = false

    // MARK: - UIKit Properties Only

    var uiKitSelectedId: Int = Bool.random() ? 0 : -1
    var uiKitCanAnimated: Bool = false

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

    func getInfoValue(from selectedId: Int?) -> String {
        if let selectedId {
            "SelectedID: \(selectedId)"
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

extension RadioGroupConfiguration {
    struct Item: Identifiable, Equatable {

        // MARK: - Properties

        let id: Int
        var isLongText: Bool = false
        var isAttributedText: Bool = false
        var isEnabled: Bool = true

        // MARK: - SwiftUI Properties Only

        var swiftUISecondText = "is amazing"

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
