//
//  UITraitCollection-SizeAppearance.swift
//  SparkCommon
//
//  Created by Michael Zimmermann on 07.02.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import UIKit

@_spi(SI_SPI) public extension UITraitCollection {
    func hasDifferentSizeCategory(comparedTo traitCollection: UITraitCollection?) -> Bool {
        self.preferredContentSizeCategory != traitCollection?.preferredContentSizeCategory
    }
}
