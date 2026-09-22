//
//  UIView+HoverExtension.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 08/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SparkTheming

extension UIView {

    func updateHover(
        show: Bool,
        layer: inout CAShapeLayer?,
        cornerRadius: CGFloat? = nil,
        hoverColorToken: any ColorToken
    ) {
        // Remove previous layer
        layer?.removeFromSuperlayer()

        if show {
            let width = CommonConstants.hoverPadding
            let inset = -width / 2

            // Add the coef 1.5 to avoid spacing between the view and the hover view
            let radius = (cornerRadius ?? self.frame.size.height / 2) * 1.5

            let path = UIBezierPath(
                roundedRect: self.bounds.insetBy(
                    dx: inset,
                    dy: inset
                ),
                byRoundingCorners: [
                    .topLeft,
                        .bottomLeft,
                        .topRight,
                        .bottomRight
                ],
                cornerRadii: CGSize(
                    width: radius,
                    height: radius
                )
            )

            let shape = CAShapeLayer()
            shape.lineWidth = width
            shape.path = path.cgPath
            shape.strokeColor = hoverColorToken.uiColor.resolvedColor(with: self.traitCollection).cgColor
            shape.fillColor = UIColor.clear.cgColor

            self.layer.addSublayer(shape)
            layer = shape
        }
    }
}
