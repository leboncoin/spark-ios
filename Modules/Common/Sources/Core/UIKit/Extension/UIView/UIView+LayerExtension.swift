//
//  UIView+LayerExtension.swift
//  SparkCommon
//
//  Created by robin.lemaire on 18/04/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import UIKit
import SparkTheming

@_spi(SI_SPI) public extension UIView {

    /// CGColors need to be refreshed on trait changes
    func setBorderColor(from colorToken: any ColorToken) {
        self.updateTraitsIfNeeded()

        self.layer.borderColor = colorToken.uiColor.resolvedColor(with: self.traitCollection).cgColor
    }

    func setBorderWidth(_ borderWidth: CGFloat) {
        self.layer.borderWidth = borderWidth
    }

    @available(*, deprecated, message: "Use sparkCornerRadius instead")
    func setCornerRadius(_ cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius.isInfinite ? self.frame.height / 2 : cornerRadius
    }

    func setMasksToBounds(_ masksToBounds: Bool) {
        self.layer.masksToBounds = masksToBounds
    }
}
