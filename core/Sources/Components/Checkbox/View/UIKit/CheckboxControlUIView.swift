//
//  CheckboxControlUIView.swift
//  SparkCore
//
//  Created by janniklas.freundt.ext on 18.04.23.
//  Copyright © 2023 Adevinta. All rights reserved.
//

import SwiftUI
import UIKit

class CheckboxControlUIView: UIView {

    // MARK: - Constants

    private enum Constants {
        @ScaledUIMetric static var cornerRadius: CGFloat = 4
        @ScaledUIMetric static var cornerRadiusPressed: CGFloat = 7
        @ScaledUIMetric static var lineWidth: CGFloat = 2
        @ScaledUIMetric static var lineWidthPressed: CGFloat = 4
    }

    // MARK: - Properties.

    var selectionIcon: UIImage

    var isPressed: Bool = false {
        didSet {
            self.setNeedsDisplay()
        }
    }

    var selectionState: CheckboxSelectionState = .unselected {
        didSet {
            self.setNeedsDisplay()
        }
    }

    var colors: CheckboxColorables? {
        didSet {
            self.setNeedsDisplay()
        }
    }

    var theme: Theme

    @ScaledUIMetric private var smallSpacing: CGFloat

    // MARK: - Initialization

    init(selectionIcon: UIImage, theme: Theme) {
        self.selectionIcon = selectionIcon
        self.theme = theme
        self.smallSpacing = theme.layout.spacing.small
        super.init(frame: .zero)
        self.commonInit()
    }

    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }

    private func commonInit() {
        self.backgroundColor = .clear
        self.clipsToBounds = false
        self.setNeedsDisplay()
    }

    // MARK: - Methods

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        self.setNeedsDisplay()
    }

    private var iconSize: CGSize {
        let iconSize: CGSize
        switch self.selectionState {
        case .unselected:
            return .zero
        case .selected:
            iconSize = CGSize(width: 14, height: 10)
        case .indeterminate:
            iconSize = CGSize(width: 12, height: 2)
        }
        return iconSize.scaled(for: self.traitCollection)
    }

    private var spacing: LayoutSpacing {
        return self.theme.layout.spacing
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        guard
            let colors = self.colors,
            let ctx = UIGraphicsGetCurrentContext()
        else { return }

        let spacing = self.spacing
        let traitCollection = self.traitCollection

        let bodyFontMetrics = UIFontMetrics(forTextStyle: .body)

        let scaledSpacing = bodyFontMetrics.scaledValue(for: spacing.xLarge + spacing.small, compatibleWith: traitCollection) //+ spacing.medium

        let controlRect = CGRect(x: 0, y: 0, width: scaledSpacing, height: scaledSpacing)

        let controlInnerRect = controlRect.insetBy(dx: self.smallSpacing, dy: self.smallSpacing)

        if self.isPressed {
            let lineWidth = Constants.lineWidthPressed
            let pressedBorderRectangle = controlRect.insetBy(dx: lineWidth / 2, dy: lineWidth / 2)
            let borderPath = UIBezierPath(roundedRect: pressedBorderRectangle, cornerRadius: Constants.cornerRadiusPressed)
            borderPath.lineWidth = lineWidth
            colors.pressedBorderColor.uiColor.setStroke()
            ctx.setStrokeColor(colors.pressedBorderColor.uiColor.cgColor)
            borderPath.stroke()
        }

        let color = colors.checkboxTintColor.uiColor
        ctx.setStrokeColor(color.cgColor)
        ctx.setFillColor(color.cgColor)

        let scaledOffset = Constants.lineWidth
        let rectangle = controlInnerRect.insetBy(dx: scaledOffset/2, dy: scaledOffset/2)

        let path = UIBezierPath(roundedRect: rectangle, cornerRadius: Constants.cornerRadius)
        path.lineWidth = scaledOffset
        color.setStroke()
        color.setFill()

        let iconSize = self.iconSize
        switch self.selectionState {
        case .unselected:
            path.stroke()

        case .indeterminate:
            path.stroke()
            path.fill()

            let origin = CGPoint(
                x: controlInnerRect.origin.x + controlInnerRect.width / 2 - iconSize.width / 2,
                y: controlInnerRect.origin.y + controlInnerRect.height / 2 - iconSize.height / 2
            )
            let iconRect = CGRect(origin: origin, size: iconSize)
            let iconPath = UIBezierPath(roundedRect: iconRect, cornerRadius: bodyFontMetrics.scaledValue(for: iconSize.height / 2, compatibleWith: traitCollection))
            colors.checkboxIconColor.uiColor.setFill()
            iconPath.fill()

        case .selected:
            path.stroke()
            path.fill()

            let origin = CGPoint(
                x: controlInnerRect.origin.x + controlInnerRect.width / 2 - iconSize.width / 2,
                y: controlInnerRect.origin.y + controlInnerRect.height / 2 - iconSize.height / 2
            )
            let iconRect = CGRect(origin: origin, size: iconSize)
            colors.checkboxIconColor.uiColor.set()
            self.selectionIcon.draw(in: iconRect)
        }
    }
}
