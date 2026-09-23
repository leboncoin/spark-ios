//
//  TextLinkVariant.swift
//  SparkComponentTextLink
//
//  Created by robin.lemaire on 25/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit

/// A text link variant is used to distinguish between different design and appearance options.
public enum TextLinkVariant: CaseIterable {
    /// A text link with an underline.
    case underline

    /// A text link without any variant (underline).
    /// *Not recommended, please use it carefully.*
    case none

    // MARK: - Properties

    /// The default case. Equals to **.underline**.
    public static let `default`: Self = .underline
}
