//
//  NSLayoutConstraint+SizeExtension.swift
//  Spark
//
//  Created by robin.lemaire on 15/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit

@_spi(SI_SPI) public extension NSLayoutConstraint {

    /// Add width and height constraints on view
    ///
    /// - Parameters:
    ///   - size: the size constraints of view
    ///   - from: the source view
    static func size(_ size: CGSize, from: UIView) {
        NSLayoutConstraint.activate([
            from.widthAnchor.constraint(equalToConstant: size.width),
            from.heightAnchor.constraint(equalToConstant: size.height)
        ])
    }
    /// Add width constraints on view
    ///
    /// - Parameters:
    ///   - width: the width constraints of view
    ///   - from: the source view
    static func width(_ width: CGFloat, from: UIView) {
        from.widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    /// Add height constraints on view
    ///
    /// - Parameters:
    ///   - height: the height constraints of view
    ///   - from: the source view
    static func height(_ height: CGFloat, from: UIView) {
        from.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
}
