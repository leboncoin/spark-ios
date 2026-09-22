//
//  View+OptionalAnimationExtension.swift
//  SparkCommon
//
//  Created by robin.lemaire on 03/07/2025.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

/// Returns the result of recomputing the view's body with the provided
/// animation.
///
/// This function sets the given ``Animation`` as the ``Transaction/animation``
/// property of the thread's current ``Transaction``.
public func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
    if UIAccessibility.isReduceMotionEnabled {
        return try body()
    } else {
        return try withAnimation(animation, body)
    }
}
