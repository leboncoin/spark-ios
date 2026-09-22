//
//  SkyTheme.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/08/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

public struct SkyTheme: Theme {

    // MARK: - Properties

    public init() {}

    public static let shared = Self()

    public let border: any Border = SkyBorder()
    public let colors: any Colors = SkyColors()
    public let elevation: any Elevation = SkyElevation()
    public let layout: any Layout = SkyLayout()
    public let typography: any Typography = SkyTypography()
    public let dims: any Dims = SkyDims()
}
