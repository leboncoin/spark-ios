//
//  BorderConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 01/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

class BorderConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var width: BorderDefault.Width = .random
    var position: BorderPosition = .default
    var dash: CGFloat = 0

    // MARK: - SwiftUI Properties Only

    var swiftUIIsScaled: Bool = true

    // MARK: - Style Properties

    lazy var borderColor: any ColorToken = {
        self.theme.value.colors.main.main
    }()

    lazy var maxWidth: CGFloat = {
        self.theme.value.border.width.medium
    }()

    lazy var contentSize: CGSize = {
        .init(width: 200, height: 48)
    }()

    // MARK: - Methods

    override func random() {
        self.width = .random
        self.position = .random
    }
}
