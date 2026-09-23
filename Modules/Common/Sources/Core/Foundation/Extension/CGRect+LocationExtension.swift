//
//  CGRect+LocationExtension.swift
//  SparkCommon
//
//  Created by Michael Zimmermann on 07.12.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

@_spi(SI_SPI) public extension CGRect {
    @available(*, deprecated, message: "Only used by the deprecated Rating component.")
    func pointIndex(of point: CGPoint, horizontalSlices items: Int) -> Int? {
        guard items > 0, self.contains(point) else {
            return nil
        }

        let itemWidth = self.width / CGFloat(items)
        return max(Int(ceil(point.x / itemWidth)) - 1, 0)
    }
}
