//
//  ButtonAlignment.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 11/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import UIKit

/// The alignment of the switch.
public enum ButtonAlignment: CaseIterable {
    /// Image on the leading edge of the button.
    /// Text on the trailing edge of the button.
    /// Not interpreted if button contains only just image or just text.
    case leadingImage
    /// Image on the trailing edge of the button.
    /// Text on the leading edge of the button
    /// Not interpreted if button contains only just image or just text.
    case trailingImage

    // MARK: - Properties

    /// The defautl value. Equals to **.trailingImage**
    public static let `default`: ButtonAlignment = .trailingImage

    var isTrailingImage: Bool {
        return self == .trailingImage
    }

    var uiKitImagePlacement: NSDirectionalRectEdge {
        switch self {
        case .leadingImage:
            return .leading
        case .trailingImage:
            return .trailing
        }
    }
}
