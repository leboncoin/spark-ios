//
//  PopoverIntent.swift
//  SparkComponentPopover
//
//  Created by louis.borlee on 25/06/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Foundation

/// Intent used to get the background & foreground colors of the popover.
public enum PopoverIntent: CaseIterable {
    case info
    case surface

    @available(*, deprecated, message: "Not used anymore by the Spark popover")
    case accent
    @available(*, deprecated, message: "Not used anymore by the Spark popover")
    case neutral
    @available(*, deprecated, message: "Not used anymore by the Spark popover")
    case main
    @available(*, deprecated, message: "Not used anymore by the Spark popover")
    case support
    @available(*, deprecated, message: "Not used anymore by the Spark popover")
    case success
    @available(*, deprecated, message: "Not used anymore by the Spark popover")
    case alert
    @available(*, deprecated, message: "Not used anymore by the Spark popover")
    case error

    // MARK: - Properties

    public static var allCases: [PopoverIntent] = [
        .info,
        .surface
    ]

    /// The default value of the intent.
    public static let `default`: Self = .surface
}
