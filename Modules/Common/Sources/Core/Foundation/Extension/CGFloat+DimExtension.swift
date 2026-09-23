//
//  CGFloat+DimExtension.swift
//  SparkCommon
//
//  Created by robin.lemaire on 26/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

internal extension CGFloat {

    /// Allows you to know whether the dim can be displayed or not.
    var showViewFromDim: Bool {
        self < 1.0
    }
}
