//
//  ElevationDropShadowsDefault.swift
//  SparkTheming
//
//  Created by louis.borlee on 27/03/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

public struct ElevationDropShadowsDefault: ElevationDropShadows {

    // MARK: - Properties

    public let small: any ElevationShadow
    public let medium: any ElevationShadow
    public let large: any ElevationShadow
    public let extraLarge: any ElevationShadow

    // MARK: - Init

    public init(
        small: any ElevationShadow,
        medium: any ElevationShadow,
        large: any ElevationShadow,
        extraLarge: any ElevationShadow
    ) {
        self.small = small
        self.medium = medium
        self.large = large
        self.extraLarge = extraLarge
    }
}
