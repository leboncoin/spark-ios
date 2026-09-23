//
//  ButtonSize.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 11/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkComponentSpinner

/// Buttons come in different heights.
public enum ButtonSize: CaseIterable {
    /// A small button with a base height of 32 points.
    @available(*, deprecated, message: "You must use the .medium size to respect the Apple's guideline.")
    case small
    /// A medium button with a base height of 44 points.
    case medium
    /// A large button with a base height of 56 points.
    case large

    // MARK: - Properties

    public static var allCases: [ButtonSize] = [.medium, large]

    /// The defautl value. Equals to **.medium**
    public static let `default`: ButtonSize = .medium
}
