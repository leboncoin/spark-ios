//
//  BorderPosition.swift
//  SparkCommon
//
//  Created by robin.lemaire on 20/10/2025.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

/// This enum is used only for SwiftUI.
/// It allows you to position the borders : inner, overlay or outer the view
public enum BorderPosition: String, Hashable, CaseIterable {
    case inner
    case overlay
    case outer

    // MARK: - Properties

    /// The default case. Equals to **.overlay**.
    public static let `default` = Self.overlay

    // MARK: - Methods

    func inset(width: CGFloat) -> CGFloat {
        switch self {
        case .inner: .zero
        case .overlay: .zero
        case .outer: -width / 2
        }
    }
}
