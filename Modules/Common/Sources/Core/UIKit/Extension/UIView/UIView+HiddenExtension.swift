//
//  UIView+HiddenExtension.swift
//  SparkCommon
//
//  Created by michael.zimmermann on 16.08.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import UIKit

@_spi(SI_SPI) public extension UIView {
    var isNotHidden: Bool {
        return !self.isHidden
    }
}
