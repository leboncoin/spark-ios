//
//  TextLinkAlignment.swift
//  SparkComponentTextLink
//
//  Created by robin.lemaire on 25/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

/// The alignment of the switch.
public enum TextLinkAlignment: CaseIterable {
    /// Image on the leading edge of the textlink.
    /// Text on the trailing edge of the textlink.
    /// Not interpreted if textlink contains only text.
    case leadingImage
    /// Image on the trailing edge of the textlink.
    /// Text on the leading edge of the textlink
    /// Not interpreted if textlink contains only text.
    case trailingImage

    // MARK: - Properties

    /// The default case. Equals to **.leadingImage**.
    public static let `default`: Self = .leadingImage

    var isTrailingImage: Bool {
        return self == .trailingImage
    }
}
