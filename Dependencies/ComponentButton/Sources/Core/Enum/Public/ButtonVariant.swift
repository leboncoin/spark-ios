//
//  ButtonVariant.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 11/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

/// A button variant is used to distinguish between different design and appearance options.
public enum ButtonVariant: CaseIterable {
    /// A contrast button with a solid background for better readability.
    case contrast
    /// A filled button with a solid background.
    case filled
    /// A ghost button with no background at all.
    case ghost
    /// A transparent button with an outline-border.
    case outlined
    /// A tinted button with a solid background.
    case tinted

    // MARK: - Properties

    /// The defautl value. Equals to **.filled**
    public static let `default`: ButtonVariant = .filled
}
