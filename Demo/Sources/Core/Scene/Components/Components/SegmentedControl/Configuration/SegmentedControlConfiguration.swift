//
//  SegmentedControlConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 25/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

class SegmentedControlConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var numberOfSegments = 3 {
        didSet {
            self.updateSegments()
        }
    }
    var contentType: SegmentedControlContentType = .default

    var items = [Item]()

    // MARK: - Initialization

    required init() {
        super.init()

        self.updateSegments()

        self.isEnabled.showConfiguration = true
        self.accessibilityLabel.showConfiguration = true
    }

    // MARK: - Update

    func updateSegments() {
        let lastNumberOfSegments = self.items.count
        if self.numberOfSegments > lastNumberOfSegments {
            repeat {
                self.items.append(Item(id: self.items.count))
            } while self.numberOfSegments > self.items.count
        } else if self.numberOfSegments < lastNumberOfSegments {
            self.items.removeLast()
        }
    }

    // MARK: - Getter

    override func isInvertedBackground() -> Bool {
        false
    }

    // MARK: - Methods

    override func random() {
        self.numberOfSegments = Int.random(in: 2...8)
        self.contentType = .random
    }
}

// MARK: - Sub Model

extension SegmentedControlConfiguration {
    struct Item: Identifiable {

        // MARK: - Properties

        let id: Int
        var text: String
        var icon: Iconography
        var contentType: SegmentedControlContentType = .multipleCases.randomElement() ?? .default

        // MARK: - Initialization

        init(id: Int) {
            self.id = id
            self.text = "My item \(id)"
            self.icon = .random
        }
    }
}
