//
//  CGFloat+AngleExtension.swift
//  SparkCommon
//
//  Created by robin.lemaire on 25/11/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Foundation

internal extension CGFloat {

    var degreesToRadians: Self {
        return self * .pi / 180
    }
}
