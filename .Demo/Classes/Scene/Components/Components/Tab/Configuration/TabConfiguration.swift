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

    var intent: TabIntent = .random
    var isEqualSize: Bool = .random()
    var tabSize: TabSize = .random
    var numberOfTabs = 4 {
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
        let lastNumberOfTabs = self.items.count
        if self.numberOfTabs > lastNumberOfTabs {
            repeat {
                self.items.append(Item(id: self.items.count + 1))
            } while self.numberOfTabs > self.items.count
        } else if self.numberOfTabs < lastNumberOfTabs {
            self.items.removeLast()
        }
    }
}

// MARK: - Sub Model

extension TabConfiguration {
    struct Item: Identifiable {

        // MARK: - Properties

        let id: Int
        var text: String
        var icon: Iconography? = .optionalRandom
        var isEnabled: Bool = .random()
        var isBadge: Bool = .random()
        let badgeValue = Int.random(in: 1...99)

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
        switch self {
        case .md: return .medium
        case .xs: return .small
        case .sm: return .small
        @unknown default: return .medium
        }
    }
}
