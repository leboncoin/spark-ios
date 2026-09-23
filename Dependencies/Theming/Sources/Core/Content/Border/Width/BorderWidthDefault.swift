//
//  BorderWidthDefault.swift
//  SparkTheming
//
//  Created by robin.lemaire on 05/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

public struct BorderWidthDefault: BorderWidth {

    // MARK: - Properties

    public let small: CGFloat
    public let medium: CGFloat

    // MARK: - Initialization

    public init(
        small: CGFloat,
        medium: CGFloat
    ) {
        self.small = small
        self.medium = medium
    }
}
