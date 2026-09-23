//
//  ButtonShape.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 11/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

/// Buttons can have different shapes.
public enum ButtonShape: CaseIterable {
    /// Button with pill-like shape.
    case pill

    /// Button with rounded corners.
    case rounded

    /// Square button with no rounded corners.
    @available(*, deprecated, message: "Use instead the .rounded case")
    case square

    // MARK: - Properties

    public static var allCases: [ButtonShape] = [.pill, rounded]

    /// The defautl value. Equals to **.rounded**
    public static let `default`: ButtonShape = .rounded
}
