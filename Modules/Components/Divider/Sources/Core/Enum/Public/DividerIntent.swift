//
//  DividerIntent.swift
//  SparkComponentDivider
//
//  Created by louis.borlee on 17/07/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

/// The intent of the divider.
public enum DividerIntent: CaseIterable {

    case outline
    case outlineHigh

    @available(*, deprecated, message: "Use outline or outlineHigh instead")
    case accent
    @available(*, deprecated, message: "Use outline or outlineHigh instead")
    case success
    @available(*, deprecated, message: "Use outline or outlineHigh instead")
    case alert
    @available(*, deprecated, message: "Use outline or outlineHigh instead")
    case error
    @available(*, deprecated, message: "Use outline or outlineHigh instead")
    case info
    @available(*, deprecated, message: "Use outline or outlineHigh instead")
    case neutral
    @available(*, deprecated, message: "Use outline or outlineHigh instead")
    case main
    @available(*, deprecated, message: "Use outline or outlineHigh instead")
    case support

    // MARK: - Properties

    public static var allCases: [DividerIntent] = [
        .outline,
        .outlineHigh
    ]

    /// The default case. Equals to **.outline**.
    public static let `default`: Self = .outline
}
