//
//  CircularMeterIntent.swift
//  SparkComponentCircularMeter
//
//  Created by robin.lemaire on 27/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

/// The intent of the circular meter.
public enum CircularMeterIntent: CaseIterable {
    case alert
    case error
    case info
    case main
    case success
    case support

    // MARK: - Properties

    /// The default case. Equals to **.support**.
    public static let `default`: Self = .support
}
