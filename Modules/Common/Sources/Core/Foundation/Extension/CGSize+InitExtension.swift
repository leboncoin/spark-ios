//
//  CGSize+InitExtension.swift
//  SparkCommon
//
//  Created by robin.lemaire on 10/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

public extension CGSize {

    /// Init a CGSize with a single value.
    init(value: CGFloat) {
        self.init(width: value, height: value)
    }
}
