//
//  BorderDefault.swift
//  SparkTheming
//
//  Created by robin.lemaire on 28/02/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

public struct BorderDefault: Border {

    // MARK: - Properties

    public let width: any BorderWidth
    public let radius: any BorderRadius

    // MARK: - Initialization

    public init(
        width: any BorderWidth,
        radius: any BorderRadius
    ) {
        self.width = width
        self.radius = radius
    }
}
