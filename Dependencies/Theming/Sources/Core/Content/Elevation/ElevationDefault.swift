//
//  ElevationDefault.swift
//  SparkTheming
//
//  Created by louis.borlee on 27/03/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

public struct ElevationDefault: Elevation {

    // MARK: - Properties

    public let dropShadow: any (ElevationDropShadows & ElevationShadow)

    // MARK: - Init

    public init(dropShadow: any (ElevationDropShadows & ElevationShadow)) {
        self.dropShadow = dropShadow
    }
}
