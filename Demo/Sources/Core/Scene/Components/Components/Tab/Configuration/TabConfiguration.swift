//
//  TabConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 27/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

class TabConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var intent: TabIntent = .default
    var tabSize: TabSize = .default
    var isEqualSize: Bool = true
    var numberOfTabs = 3 {
        didSet {
            self.updateItems()
        }
    }

    var items = [Item]()

    // MARK: - UIKit Properties Only

    var uiKitIsAnimated: Bool = false

    // MARK: - Initialization

    required init() {
        super.init()

        self.updateItems()

        self.isEnabled.showConfiguration = true
    }

    // MARK: - Update

    func updateItems() {
        let lastNumberOfTabs = self.items.count
        if self.numberOfTabs > lastNumberOfTabs {
            repeat {
                self.items.append(Item(id: self.items.count + 1))
            } while self.numberOfTabs > self.items.count
        } else if self.numberOfTabs < lastNumberOfTabs {
            self.items.removeLast()
        }
    }

    // MARK: - Methods

    override func random() {
        self.intent = .random
        self.isEqualSize = .random()
        self.tabSize = .random
    }
}

// MARK: - Sub Model

extension TabConfiguration {
    struct Item: Identifiable {

        // MARK: - Properties

        let id: Int
        var text: String
        var icon: Iconography?
        var isBadge: Bool = .random()
        let badgeValue = Int.random(in: 1...99)

        var uiKitIsAttributedText: Bool = false

        // MARK: - Initialization

        init(id: Int) {
            self.id = id
            self.text = "My item \(id)"
        }
    }
}

// MARK: - Extension

extension TabSize {

    var demoBadgeSize: BadgeSize {
        return switch self {
        case .xSmall: .small
        case .small: .small
        case .medium: .medium
        default: .medium
        }
    }
}
