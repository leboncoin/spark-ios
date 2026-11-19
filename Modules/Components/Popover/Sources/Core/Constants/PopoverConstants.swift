//
//  PopoverConstants.swift
//  SparkComponentPopover
//
//  Created by robin.lemaire on 15/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

enum PopoverConstants {

    // MARK: - Properties

    /// The additional top padding of the UIKit popover content (liquid glass).
    static let liquidGlassTopPadding: CGFloat = 10

    @available(*, deprecated, message: "Not used anymore by the Spark popover")
    static var isLiquidGlass: Bool {
        return if #available(iOS 26, *) {
            true
        } else {
            false
        }
    }
}
