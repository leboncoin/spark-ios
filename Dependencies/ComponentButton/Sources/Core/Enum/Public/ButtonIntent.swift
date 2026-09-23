//
//  ButtonIntent.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 11/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

/// A button intent is used to apply a color scheme to a button.
@frozen
public enum ButtonIntent: CaseIterable {
    case accent
    case ai
    case alert
    case danger
    case info
    case main
    case neutral
    case success
    case support
    case surface
    case surfaceInverse

    /// The defautl value. Equals to **.main**
    public static let `default`: ButtonIntent = .main
}
