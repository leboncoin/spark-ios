//
//  ColorTokenGeneratedMock.swift
//  SparkThemingTesting
//
//  Created by janniklas.freundt.ext on 10.05.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SwiftUI
import UIKit

public extension ColorTokenGeneratedMock {

    // MARK: - Initialization

    convenience init(uiColor: UIColor) {
      self.init()
      self.uiColor = uiColor
    }

    // MARK: - Methods

    static func random() -> ColorTokenGeneratedMock {
        let color = ColorTokenGeneratedMock()
        let random = UIColor.random()
        color.underlyingUiColor = random
        color.underlyingColor = Color(random)
        return color
    }

    static func mock(_ color: Color) -> ColorTokenGeneratedMock {
        let mock = ColorTokenGeneratedMock()
        mock.color = color
        return mock
    }

    static func red() -> ColorTokenGeneratedMock {
        let color = ColorTokenGeneratedMock()
        color.underlyingColor = .red
        color.underlyingUiColor = .red
        return color
    }

    static func blue() -> ColorTokenGeneratedMock {
        let color = ColorTokenGeneratedMock()
        color.underlyingColor = .blue
        color.underlyingUiColor = .blue
        return color
    }

    static func green() -> ColorTokenGeneratedMock {
        let color = ColorTokenGeneratedMock()
        color.underlyingColor = .green
        color.underlyingUiColor = .green
        return color
    }

    static func orange() -> ColorTokenGeneratedMock {
        let color = ColorTokenGeneratedMock()
        color.underlyingColor = .orange
        color.underlyingUiColor = .orange
        return color
    }

    static func yellow() -> ColorTokenGeneratedMock {
        let color = ColorTokenGeneratedMock()
        color.underlyingColor = .yellow
        color.underlyingUiColor = .yellow
        return color
    }

    static func purple() -> ColorTokenGeneratedMock {
        let color = ColorTokenGeneratedMock()
        color.underlyingColor = .purple
        color.underlyingUiColor = .purple
        return color
    }

    // MARK: - Equatable

    static func == (lhs: ColorTokenGeneratedMock, rhs: ColorTokenGeneratedMock) -> Bool {
        return lhs === rhs
    }
}

// MARK: - Private public extension

private extension UIColor {
    static func random(
        hue: CGFloat = CGFloat.random(in: 0...1),
        saturation: CGFloat = CGFloat.random(in: 0.5...1), // from 0.5 to 1.0 to stay away from white
        brightness: CGFloat = CGFloat.random(in: 0.5...1), // from 0.5 to 1.0 to stay away from black
        alpha: CGFloat = 1
    ) -> UIColor {
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
    }
}
