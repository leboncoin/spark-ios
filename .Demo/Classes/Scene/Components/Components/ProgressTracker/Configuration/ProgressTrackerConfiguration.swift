//
//  ProgressTrackerConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 29/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

class ProgressTrackerConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var intent: ProgressTrackerIntent = .random
    var variant: ProgressTrackerVariant = .random
    var size: ProgressTrackerSize = .random
    var orientation: ProgressTrackerOrientation = .random
    var interaction: ProgressTrackerInteractionState = .random
    var contentType: ProgressTrackerContentType = .random
    var showLabel: Bool = true
    var completedPageIndicatorIcon: Iconography? = .optionalRandom
    var currentPageIndicatorIcon: Iconography? = .optionalRandom
    var numberOfPages: Int = Int.random(in: 2...5) {
        didSet {
            self.updatePages()
        }
    }
    var pages = [Page]()

    var currentPageIndex: Int = 0
    var disabledPageIndex: Int = -1

    // MARK: - SwiftUI Properties Only

    var swiftUIUseFullWidth: Bool = .random()

    // MARK: - Initialization

    required init() {
        super.init()

        self.updatePages()

        self.isEnabled.showConfiguration = true
    }

    // MARK: - Update

    func updatePages() {
        let lastNumberOfPages = self.pages.count
        if self.numberOfPages > lastNumberOfPages {
            repeat {
                self.pages.append(Page(id: self.pages.count))
            } while self.numberOfPages > self.pages.count
        } else if self.numberOfPages < lastNumberOfPages {
            self.pages.removeLast()
        }
    }
}

// MARK: - Sub Model

extension ProgressTrackerConfiguration {
    struct Page: Identifiable {

        // MARK: - Properties

        let id: Int
        var title: String
        var isAttributedTitle: Bool = .random()
        var indicatorIcon: Iconography = .random
        var indicatorText: String

        // MARK: - Initialization

        init(id: Int) {
            self.id = id
            self.title = "Page \(id + 1)"
            self.indicatorText = "A\(id + 1)"
        }
    }
}
