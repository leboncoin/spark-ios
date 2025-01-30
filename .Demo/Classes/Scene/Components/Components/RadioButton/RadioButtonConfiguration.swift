//
//  RadioButtonConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 29/01/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import Foundation

class RadioButtonConfiguration: ComponentConfiguration {

    // MARK: - Sub Model

    struct Item: Identifiable {
        let id: Int
        var text: String

        init(id: Int) {
            self.id = id
            self.text = "My item \(id)"
        }
    }

    // MARK: - Properties

    var intent: RadioButtonIntent = .random
    var labelAlignment: RadioButtonLabelAlignment = .random
    var groupLayout: RadioButtonGroupLayout = .random
    var numberOfItems: Int = Int.random(in: 2...5) {
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

    // MARK: - Getter

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
