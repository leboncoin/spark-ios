//
//  CircularMeterSize.swift
//  SparkComponentCircularMeter
//
//  Created by robin.lemaire on 28/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

/// Different sizes of circular meter.
public enum CircularMeterSize: CaseIterable {
    /// Small circular meter with diameter of 24px
    case small

    /// Medium circular meter with diameter of 64px
    case medium

    /// Large circular meter with diameter of 96px
    case large

    /// Extra large circular meter with diameter of 128px
    case xLarge

    // MARK: - Properties

    /// The default case. Equals to **.large**.
    public static let `default`: Self = .large
}
