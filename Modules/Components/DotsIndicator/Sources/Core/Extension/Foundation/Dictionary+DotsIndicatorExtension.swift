//
//  Dictionary+DotsIndicatorExtension.swift
//  SparkComponentDotsIndicator
//
//  Created by Robin Lemaire on 26/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import CoreGraphics

extension Dictionary where Key == Int, Value == CGRect {

    // MARK: - Methods

    /// The width of one step (an inactive dot and its spacing), measured from the dots frames.
    /// Returns 0 if the first, last or active dot frame is missing.
    func dotsIndicatorStepWidth(selectedPage: Int, numberOfPages: Int) -> CGFloat {
        guard numberOfPages > 1,
              let first = self[0],
              let last = self[numberOfPages - 1],
              let active = self[selectedPage] else {
            return 0
        }

        let contentWidth = Swift.max(first.maxX, last.maxX) - Swift.min(first.minX, last.minX)
        return (contentWidth - active.width) / CGFloat(numberOfPages - 1)
    }
}
