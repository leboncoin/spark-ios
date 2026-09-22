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

    private let colorName: String
    private let bundle: Bundle

    public var uiColor: UIColor {
        guard let uiColor = UIColor(named: self.colorName, in: self.bundle, compatibleWith: nil) else {
            fatalError("Missing color asset named \(self.colorName) in bundle \(self.bundle.bundleIdentifier ?? self.bundle.description)")
        }
        return uiColor
    }

    public var color: Color {
        return Color(self.colorName, bundle: self.bundle)
    }

    // MARK: - Initialization

    public init(named colorName: String, in bundle: Bundle) {
        self.colorName = colorName
        self.bundle = bundle
    }
}
