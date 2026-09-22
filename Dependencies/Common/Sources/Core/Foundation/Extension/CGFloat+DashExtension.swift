//
//  CGFloat+DashExtension.swift
//  SparkCommon
//
//  Created by robin.lemaire on 26/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

internal extension CGFloat {

    var toDashArray: [Self] {
        return if self > 0 {
            [self]
        } else {
            []
        }
    }
}
