//
//  BorderRadiusConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 01/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

class BorderRadiusConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var width: BorderDefault.Width = .random

    var radius: BorderDefault.Radius = .random
    var topLeadingRadius: CGFloat = 0
    var topTrailingRadius: CGFloat = 0
    var bottomTrailingRadius: CGFloat = 0
    var bottomLeadingRadius: CGFloat = 0

    var position: BorderPosition = .default
    var dash: CGFloat = 0
    var isHighlighted: Bool = .random()

    // MARK: - SwiftUI Properties Only

    var swiftUIIsScaled: Bool = true

    // MARK: - Style Properties

    lazy var backgroundColor: any ColorToken = {
        self.theme.value.colors.support.supportVariant
    }()

    lazy var borderColor: any ColorToken = {
        self.theme.value.colors.main.main
    }()

    lazy var maxWidth: CGFloat = {
        self.theme.value.border.width.medium
    }()

    let maxRadius: CGFloat = 24

    lazy var contentSize: CGSize = {
        .init(width: 200, height: 80)
    }()

    // MARK: - Methods

    override func random() {
        self.width = .random
        self.radius = .random
        self.position = .random
        self.isHighlighted = .random()
    }
}
