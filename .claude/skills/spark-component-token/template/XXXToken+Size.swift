//
//  XXXToken+Size.swift
//  SparkComponentXXX
//
//  Created by robin.lemaire on 09/09/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

// MARK: - Size

public extension XXXToken {

    /// Contains size-related constants for the XXX component.
    ///
    /// This category only exposes fixed constants (no theme-dependent values),
    /// so it has a parameterless initializer and can be used without a theme.
    struct Size: Equatable {

        // MARK: - Properties

        /// The height for a medium-sized XXX.
        public let mediumHeight: CGFloat = 32

        /// The height for a large-sized XXX.
        public let largeHeight: CGFloat = 40

        /// The size of the icon within the XXX.
        public let iconSize: CGFloat = 16

        // MARK: - Initialization

        /// Creates a Size token.
        public init() {}
    }
}
