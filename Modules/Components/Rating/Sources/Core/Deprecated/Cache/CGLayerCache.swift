//
//  CGLayerCache.swift
//  SparkComponentRating
//
//  Created by michael.zimmermann on 08.11.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
import UIKit

// sourcery: AutoMockable
@available(*, deprecated, message: "Not used anymore by the new SparkRatingInput/SparkRatingDisplay or SparkUIRatingInput/SparkUIRatingDisplay")
protocol CGLayerCaching {
    func object(forKey: NSString) -> CGLayer?
    func setObject(_ layer: CGLayer, forKey: NSString)
}

/// A simple facade for a static NSCache
@available(*, deprecated, message: "Not used anymore by the new SparkRatingInput/SparkRatingDisplay or SparkUIRatingInput/SparkUIRatingDisplay")
final class CGLayerCache: CGLayerCaching {
    private static var cache = NSCache<NSString, CGLayer>()

    func object(forKey key: NSString) -> CGLayer? {
        return Self.cache.object(forKey: key)
    }

    func setObject(_ layer: CGLayer, forKey key: NSString) {
        Self.cache.setObject(layer, forKey: key)
    }
}
