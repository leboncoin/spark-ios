//
//  ProgressTrackerConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 29/01/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
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
    var useFullWidth: Bool = .random()
    var showLabel: Bool = .random()
    var completedPageIndicatorIcon: Iconography? = .optionalRandom
    var isCurrentPageIndicator: Bool = .random()
    var numberOfPages: Int = Int.random(in: 2...5) {
        didSet {
            self.updatePages()
        }
    }
    var pages = [Page]()

    var currentPageIndex: Int = 0
    var disabledPageIndex: Int = -1

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
                self.pages.append(Page(id: self.pages.count + 1))
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
        var text: String
        var icon: Iconography?

        // MARK: - Initialization

        init(id: Int) {
            self.id = id
            self.text = "Page \(id)"
        }
    }
}
