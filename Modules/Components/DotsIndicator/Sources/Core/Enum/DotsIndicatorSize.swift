//
//  DotsIndicatorSize.swift
//  SparkComponentDotsIndicator
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

/// The size of the dots indicator.
@frozen
public enum DotsIndicatorSize: CaseIterable {
    /// Small size. Use it only as a visual-guide element.
    case small
    /// Medium size.
    case medium
    /// Large size. The only size which can have the tap interaction.
    case large

    // MARK: - Properties

    /// The default value. Equals to **.medium**.
    public static let `default`: DotsIndicatorSize = .medium
}
