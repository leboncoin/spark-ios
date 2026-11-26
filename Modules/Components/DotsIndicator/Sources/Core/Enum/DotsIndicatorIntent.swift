//
//  DotsIndicatorIntent.swift
//  SparkComponentDotsIndicator
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

/// The intent of the dots indicator.
@frozen
public enum DotsIndicatorIntent: CaseIterable {
    /// Support intent. Use it on a light background.
    case support
    /// Surface intent. Use it on a dark background (on an image for example).
    case surface

    // MARK: - Properties

    /// The default value. Equals to **.support**.
    public static let `default`: DotsIndicatorIntent = .support
}
