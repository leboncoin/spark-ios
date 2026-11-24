//
//  Int+DotIndicatorExtension.swift
//  SparkComponentDotIndicator
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

extension Int {

    // MARK: - Methods

    /// Returns the page clamped between the first and the last page.
    func clampedPage(numberOfPages: Int) -> Int {
        guard numberOfPages > 0 else {
            return 0
        }

        return Swift.min(Swift.max(self, 0), numberOfPages - 1)
    }

    /// Returns the previous page (or the first page if there is no previous page).
    func previousPage(numberOfPages: Int) -> Int {
        return (self - 1).clampedPage(numberOfPages: numberOfPages)
    }

    /// Returns the next page (or the last page if there is no next page).
    func nextPage(numberOfPages: Int) -> Int {
        return (self + 1).clampedPage(numberOfPages: numberOfPages)
    }
}
