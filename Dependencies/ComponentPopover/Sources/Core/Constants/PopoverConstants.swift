//
//  PopoverConstants.swift
//  SparkComponentPopover
//
//  Created by robin.lemaire on 15/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

enum PopoverConstants {

    static var isLiquidGlass: Bool {
        return if #available(iOS 26, *) {
            true
        } else {
            false
        }
    }
}
