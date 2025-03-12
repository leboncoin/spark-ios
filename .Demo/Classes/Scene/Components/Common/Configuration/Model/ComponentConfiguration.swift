//
//  ComponentConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 17/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI

class ComponentConfiguration: Identifiable {

    // MARK: - Global Properties

    let id = UUID().uuidString
    var theme = DemoThemes.shared.mainTheme
    var isEnabled = ShowConfigurationBool()

    // MARK: - Accessibility Properties

    var accessibilityLabel = ShowConfigurationString()
    var accessibilityValue = ShowConfigurationString()

    // MARK: - Size Properties

    var swiftUIIsMinWidth = ShowConfigurationBool()
    var swiftUIWidth = ShowConfigurationSize(name: "Width")
    var height = ShowConfigurationSize(name: "Height")

    // MARK: - UIKit only Properties

    var uiKitControlType = ShowUIKitControlType()
    var uiKitIsSelected = ShowConfigurationBool()
    var uiKitInfoLabel: UILabel?

    // MARK: - Initialization

    required init() {
    }

    // MARK: - Getter

    func isInvertedBackground() -> Bool {
        return false
    }
}

// MARK: - Sub

protocol ShowConfiguration {
    var showConfiguration: Bool { get set }
}

struct ShowConfigurationBool: ShowConfiguration {

    // MARK: - Properties

    var showConfiguration = false
    var value = true
}

struct ShowConfigurationString: ShowConfiguration {

    // MARK: - Properties

    var showConfiguration = false
    var value = ""
}

class ShowConfigurationSize: Identifiable, ShowConfiguration {

    // MARK: - Properties

    var id: String
    var name: String

    lazy var showConfiguration: Bool = false

    var text = ""
    var minText = ""
    var maxText = ""
    var infinite = false

    // MARK: - Initialization

    init(name: String) {
        self.id = name
        self.name = name
    }

    // MARK: - Getter

    func value() -> CGFloat? {
        return self.text.cgFloat
    }

    func minValue() -> CGFloat? {
        return self.minText.cgFloat
    }

    func maxValue() -> CGFloat? {
        guard !self.infinite else {
            return .infinity
        }

        return self.maxText.cgFloat
    }
}

struct ShowUIKitControlType: ShowConfiguration {

    // MARK: - Properties

    var showConfiguration = false
    var value: ComponentControlType? = .optionalRandom
}
