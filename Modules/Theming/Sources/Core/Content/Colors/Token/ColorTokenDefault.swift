//
//  ColorTokenDefault.swift
//  SparkTheming
//
//  Created by robin.lemaire on 05/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI

public struct ColorTokenDefault: ColorToken {

    // MARK: - Properties

    /// The colors are loaded only once, at the initialization.
    /// A named color from an asset catalog is dynamic: the dark mode still works.
    public let uiColor: UIColor
    public let color: Color

    // MARK: - Initialization

    public init(named colorName: String, in bundle: Bundle) {
        guard let uiColor = UIColor(named: colorName, in: bundle, compatibleWith: nil) else {
            fatalError("Missing color asset named \(colorName) in bundle \(bundle.bundleIdentifier ?? bundle.description)")
        }

        self.uiColor = uiColor
        self.color = Color(colorName, bundle: bundle)
    }
}
