//
//  ScaledBorderRadiusViewModifierPositionSnapshotTests.swift
//  SparkCommon
//
//  Created by robin.lemaire on 01/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import XCTest
@testable import SparkCommon
@_spi(SI_SPI) @testable import SparkCommonSnapshotTesting
import SparkTheme
import SparkTheming

final class ScaledBorderRadiusViewModifierPositionSnapshotTests: SwiftUIComponentSnapshotTestCase {

    // MARK: - Tests

    func test() throws {
        let theme: any Theme = SparkTheme.shared
        for width in BorderWidth.allCases {
            self.assertSnapshot(
                matching: SnapshotView(borderWidth: width.value(from: theme)),
                modes: ComponentSnapshotTestConstants.Modes.default,
                sizes: ComponentSnapshotTestConstants.Sizes.all,
                testName: #function + "\(width)Width"
            )
        }
    }
}

// MARK: - View

private struct SnapshotView: View {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared
    @ScaledMetric var width: CGFloat = 90
    @ScaledMetric var height: CGFloat = 20

    let borderWidth: CGFloat
    let borderRadius: CGFloat
    @ScaledMetric var scaledBorderWidth: CGFloat = 0
    @ScaledMetric var scaledBorderRadius: CGFloat = 0

    let borderColor: any ColorToken

    // MARK: - Initialization

    init(borderWidth: CGFloat) {
        self.borderWidth = borderWidth
        self.borderRadius = self.theme.border.radius.large
        self._scaledBorderWidth = .init(wrappedValue: self.borderWidth)
        self._scaledBorderRadius = .init(wrappedValue: self.borderRadius)
        self.borderColor = self.theme.colors.main.main
    }

    // MARK: - View

    var body: some View {
        ScaledSnapshotView(
            scaledContent: {
                ForEach(BorderPosition.allCases, id: \.rawValue) { position in
                    Text(position.rawValue.capitalized)
                        .padding(4)
                        .frame(width: self.width, height: self.height)
                        .background(.white)
                        .sparkBorder(
                            width: self.borderWidth,
                            radius: self.borderRadius,
                            colorToken: self.borderColor,
                            position: position
                        )
                }
            },
            scaledMetricContent: {
                ForEach(BorderPosition.allCases, id: \.rawValue) { position in
                    Text(position.rawValue.capitalized)
                        .padding(4)
                        .frame(width: self.width, height: self.height)
                        .background(.white)
                        .sparkBorder(
                            width: self.scaledBorderWidth,
                            radius: self.scaledBorderRadius,
                            colorToken: self.borderColor,
                            position: position,
                            isScaled: false
                        )
                }
            },
            withoutScalingContent: {
                ForEach(BorderPosition.allCases, id: \.rawValue) { position in
                    Text(position.rawValue.capitalized)
                        .padding(4)
                        .frame(width: self.width, height: self.height)
                        .background(.white)
                        .sparkBorder(
                            width: self.borderWidth,
                            radius: self.borderRadius,
                            colorToken: self.borderColor,
                            position: position,
                            isScaled: false
                        )
                }
            }
        )
    }
}
