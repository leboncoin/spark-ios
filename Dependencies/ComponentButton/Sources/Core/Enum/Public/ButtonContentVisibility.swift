//
//  ButtonContentVisibility.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 11/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

/// Hide content view in button.
public enum ButtonContentVisibility: CaseIterable {
    /// Show all content (image and label).
    case showAll
    /// Hide the image.
    case hideImage
    /// Hide the label.
    case hideLabel

    // MARK: - Properties

    /// The defautl value. Equals to **.showAll**
    public static let `default`: ButtonContentVisibility = .showAll

    var showImage: Bool {
        self != .hideImage
    }

    var showLabel: Bool {
        self != .hideLabel
    }
}
