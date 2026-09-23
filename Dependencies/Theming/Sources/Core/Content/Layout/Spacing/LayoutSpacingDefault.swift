//
//  LayoutSpacingDefault.swift
//  SparkTheming
//
//  Created by robin.lemaire on 05/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

public struct LayoutSpacingDefault: LayoutSpacing {

    // MARK: - Properties

    public let small: CGFloat
    public let medium: CGFloat
    public let large: CGFloat
    public let xLarge: CGFloat
    public let xxLarge: CGFloat
    public let xxxLarge: CGFloat

    // MARK: - Initialization

    public init(
        small: CGFloat,
        medium: CGFloat,
        large: CGFloat,
        xLarge: CGFloat,
        xxLarge: CGFloat,
        xxxLarge: CGFloat
    ) {
        self.small = small
        self.medium = medium
        self.large = large
        self.xLarge = xLarge
        self.xxLarge = xxLarge
        self.xxxLarge = xxxLarge
    }
}
