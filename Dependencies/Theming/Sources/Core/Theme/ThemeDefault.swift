//
//  ThemeDefault.swift
//  SparkTheming
//
//  Created by robin.lemaire on 06/03/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

public struct ThemeDefault: Theme {

    // MARK: - Properties

    public let border: any Border
    public let colors: any Colors
    public let elevation: any Elevation
    public let layout: any Layout
    public let typography: any Typography
    public let dims: any Dims

    // MARK: - Initialization

    public init(
        border: any Border,
        colors: any Colors,
        elevation: any Elevation,
        layout: any Layout,
        typography: any Typography,
        dims: any Dims
    ) {
        self.border = border
        self.colors = colors
        self.elevation = elevation
        self.layout = layout
        self.typography = typography
        self.dims = dims
    }
}
