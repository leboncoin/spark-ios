//
//  BorderRadiusDefault.swift
//  SparkTheming
//
//  Created by robin.lemaire on 05/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

public struct BorderRadiusDefault: BorderRadius {

    // MARK: - Properties

    public let small: CGFloat
    public let medium: CGFloat
    public let large: CGFloat
    public let xLarge: CGFloat

    // MARK: - Initialization

    public init(
        small: CGFloat,
        medium: CGFloat,
        large: CGFloat,
        xLarge: CGFloat
    ) {
        self.small = small
        self.medium = medium
        self.large = large
        self.xLarge = xLarge
    }
}
