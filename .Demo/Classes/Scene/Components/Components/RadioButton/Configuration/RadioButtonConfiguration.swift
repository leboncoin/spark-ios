//
//  RadioButtonConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 29/01/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import Foundation

class RadioButtonConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var intent: RadioButtonIntent = .random
    var labelAlignment: RadioButtonLabelAlignment = .random
    var groupLayout: RadioButtonGroupLayout = .random
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

extension RadioButtonConfiguration {
    struct Item: Identifiable {

        // MARK: - Properties

        let id: Int
        var text: String

        // MARK: - Initialization

        init(id: Int) {
            self.id = id
            self.text = "My item \(id)"
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
