//
//  ColorsFocusDefault.swift
//  SparkTheming
//
//  Created by robin.lemaire on 27/08/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

public struct ColorsFocusDefault: ColorsFocus {

    // MARK: - Properties

    public let focus: any ColorToken
    public let onFocus: any ColorToken
    public let focusContainer: any ColorToken
    public let onFocusContainer: any ColorToken

    // MARK: - Init

    public init(
        focus: any ColorToken,
        onFocus: any ColorToken,
        focusContainer: any ColorToken,
        onFocusContainer: any ColorToken
    ) {
        self.focus = focus
        self.onFocus = onFocus
        self.focusContainer = focusContainer
        self.onFocusContainer = onFocusContainer
    }
}
