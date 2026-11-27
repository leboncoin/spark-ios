//
//  Int+DotsIndicatorExtension.swift
//  SparkComponentDotsIndicator
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import CoreGraphics

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

    /// Returns the page after a tap at the *tapLocationX* (the current page is *self*).
    /// - On the active dot: the current page.
    /// - On the side of the first dot: the previous page.
    /// - On the other side: the next page.
    ///
    /// All the values must be in the same coordinate space (layout direction independent).
    func tappedPage(
        tapLocationX: CGFloat,
        activeDotFrame: CGRect,
        firstDotFrame: CGRect,
        numberOfPages: Int
    ) -> Int {
        let page = self.clampedPage(numberOfPages: numberOfPages)

        guard tapLocationX < activeDotFrame.minX || tapLocationX > activeDotFrame.maxX else {
            return page
        }

        guard page > 0 else {
            return page.nextPage(numberOfPages: numberOfPages)
        }

        let isFirstDotBefore = firstDotFrame.midX < activeDotFrame.midX
        let isTapBefore = tapLocationX < activeDotFrame.minX

        return isFirstDotBefore == isTapBefore
        ? page.previousPage(numberOfPages: numberOfPages)
        : page.nextPage(numberOfPages: numberOfPages)
    }

    /// Returns the page after a swipe (the current page is *self*):
    /// to the left the next page, to the right the previous page.
    func swipedPage(translation: CGFloat, numberOfPages: Int) -> Int {
        if translation < 0 {
            return self.nextPage(numberOfPages: numberOfPages)
        } else if translation > 0 {
            return self.previousPage(numberOfPages: numberOfPages)
        }
        return self
    }

    /// Returns the page reached by moving the finger during the long press (one page per step).
    /// *self* is the page when the long press started.
    func longPressPage(
        translation: CGFloat,
        startTranslation: CGFloat,
        stepWidth: CGFloat,
        numberOfPages: Int
    ) -> Int {
        guard stepWidth > 0 else {
            return self
        }

        let steps = Int(((translation - startTranslation) / stepWidth).rounded())
        return (self + steps).clampedPage(numberOfPages: numberOfPages)
    }

    /// True when the frame of the dot (*self* is the index) is needed by the interactions
    /// (first, last and active dots).
    func isDotFrameReported(selectedPage: Int, numberOfPages: Int) -> Bool {
        self == 0 || self == numberOfPages - 1 || self == selectedPage
    }
}
