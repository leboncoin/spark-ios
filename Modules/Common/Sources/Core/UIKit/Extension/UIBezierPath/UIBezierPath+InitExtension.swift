//
//  UIBezierPath+InitExtension.swift
//  SparkCommon
//
//  Created by robin.lemaire on 04/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit

extension UIBezierPath {

    /// Needed to fix the bug on default init : the corner radius is not correct from a certain radius.
    convenience init(
        roundedRect rect: CGRect,
        byRoundingCorners corners: UIRectCorner,
        cornerRadius: CGFloat
    ) {
        self.init()

        let cornerRadius = min(cornerRadius, rect.width / 2, rect.height / 2)
        let originX = rect.origin.x
        let originY = rect.origin.y
        let width = rect.size.width
        let height = rect.size.height

        let path = self

        // Move to top left
        path.move(to: .init(
            x: originX + cornerRadius,
            y: originY
        ))

        // Top Left to Right
        path.addLine(to: .init(
            x: originX + width - cornerRadius,
            y: originY
        ))

        // Top Right
        if corners.contains(.topRight) {
            path.addArc(
                withCenter: .init(
                    x: originX + width - cornerRadius,
                    y: originY + cornerRadius
                ),
                radius: cornerRadius,
                startAngle: 3 * .pi / 2,
                endAngle: 0,
                clockwise: true
            )
        } else {
            path.addLine(to: .init(
                x: originX + width,
                y: originY
            ))
        }

        // Top to Bottom on Right side
        path.addLine(to: .init(
            x: originX + width,
            y: originY + height - cornerRadius
        ))

        // Bottom Right
        if corners.contains(.bottomRight) {
            path.addArc(
                withCenter: .init(
                    x: originX + width - cornerRadius,
                    y: originY + height - cornerRadius
                ),
                radius: cornerRadius,
                startAngle: 0,
                endAngle: .pi / 2,
                clockwise: true
            )
        } else {
            path.addLine(to: .init(
                x: originX + width,
                y: originY + height
            ))
        }

        // Bottom Right to Left
        path.addLine(to: .init(
            x: originX + cornerRadius,
            y: originY + height
        ))

        // Bottom Left
        if corners.contains(.bottomLeft) {
            path.addArc(
                withCenter: .init(
                    x: originX + cornerRadius,
                    y: originY + height - cornerRadius
                ),
                radius: cornerRadius,
                startAngle: .pi / 2,
                endAngle: .pi,
                clockwise: true
            )
        } else {
            path.addLine(to: .init(
                x: originX,
                y: originY + height
            ))
        }

        // Bottom to Top on Left side
        path.addLine(to: .init(
            x: originX,
            y: originY + cornerRadius
        ))

        // Top Left
        if corners.contains(.topLeft) {
            path.addArc(
                withCenter: .init(
                    x: originX + cornerRadius,
                    y: originY + cornerRadius
                ),
                radius: cornerRadius,
                startAngle: .pi,
                endAngle: 3 * .pi / 2,
                clockwise: true
            )
        } else {
            path.addLine(to: .init(
                x: originX,
                y: originY
            ))
        }

        path.close()
    }
}
