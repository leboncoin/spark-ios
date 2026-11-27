//
//  CGSize+DotsIndicatorExtension.swift
//  SparkComponentDotsIndicator
//
//  Created by Robin Lemaire on 26/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import CoreGraphics
import Foundation

extension CGSize {

    // MARK: - Properties

    /// True when the translation is long enough to be a swipe.
    var isDotsIndicatorSwipe: Bool {
        hypot(self.width, self.height) >= DotsIndicatorConstants.swipeMinimumDistance
    }
}
