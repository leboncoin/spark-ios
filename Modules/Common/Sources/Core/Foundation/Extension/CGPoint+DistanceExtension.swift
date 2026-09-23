//
//  CGPoint+DistanceExtension.swift
//  SparkCommon
//
//  Created by Michael Zimmermann on 30.11.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

@_spi(SI_SPI) public extension CGPoint {

    /// Returns the distance between two points
    func distance(to other: CGPoint) -> CGFloat {
        CGFloat(hypotf(Float(self.x - other.x), Float(self.y - other.y)))
    }
}
