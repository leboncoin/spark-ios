//
//  ScaledBorderRadiusViewModifierSnapshotTests.swift
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

final class ScaledBorderRadiusViewModifierSnapshotTests: SwiftUIComponentSnapshotTestCase {

    // MARK: - Tests

    func test_default() throws {
        let theme: any Theme = SparkTheme.shared
        for radius in BorderRadius.allCases {
            self.assertSnapshot(
                matching: SnapshotView(
                    state: .default,
                    cornerRadius: radius.value(from: theme)
                ),
                modes: ComponentSnapshotTestConstants.Modes.default,
                sizes: ComponentSnapshotTestConstants.Sizes.all,
                testName: #function + "\(radius)Radius"
            )
        }
    }

    func test_dashed() throws {
        let theme: any Theme = SparkTheme.shared
        self.assertSnapshot(
            matching: SnapshotView(
                state: .dashed,
                cornerRadius: BorderRadius.medium.value(from: theme)
            ),
            modes: ComponentSnapshotTestConstants.Modes.default,
            sizes: ComponentSnapshotTestConstants.Sizes.all
        )
    }

    func test_highlighted() throws {
        let theme: any Theme = SparkTheme.shared

        for radius in BorderRadius.allCases {
            self.assertSnapshot(
                matching: SnapshotView(
                    state: .highlighted,
                    cornerRadius: radius.value(from: theme)
                ),
                modes: ComponentSnapshotTestConstants.Modes.default,
                sizes: ComponentSnapshotTestConstants.Sizes.all,
                testName: #function + "\(radius)Radius"
            )
        }
    }
}

// MARK: - View

private struct SnapshotView: View {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    let state: BorderRadiusState

    @ScaledMetric var width: CGFloat = 90
    @ScaledMetric var height: CGFloat = 20

    let borderWidth: CGFloat
    let cornerRadius: CGFloat
    @ScaledMetric var scaledBorderWidth: CGFloat = 0
    @ScaledMetric var scaledBorderRadius: CGFloat = 0

    let borderColor: any ColorToken

    // MARK: - Initialization

    init(
        state: BorderRadiusState,
        cornerRadius: CGFloat
    ) {
        self.state = state

        self.borderWidth = self.theme.border.width.medium
        self.cornerRadius = cornerRadius
        self._scaledBorderWidth = .init(wrappedValue: self.borderWidth)
        self._scaledBorderRadius = .init(wrappedValue: self.cornerRadius)
        self.borderColor = self.theme.colors.main.main
    }

    // MARK: - View

    var body: some View {
        ScaledSnapshotView(
            scaledContent: {
                Rectangle()
                    .fill(.white)
                    .frame(width: self.width, height: self.height)
                    .border(
                        state: self.state,
                        width: self.borderWidth,
                        cornerRadius: self.cornerRadius,
                        color: self.borderColor,
                        isScaled: true
                    )
            },
            scaledMetricContent: {
                Rectangle()
                    .fill(.white)
                    .frame(width: self.width, height: self.height)
                    .border(
                        state: self.state,
                        width: self.scaledBorderWidth,
                        cornerRadius: self.scaledBorderRadius,
                        color: self.borderColor,
                        isScaled: false
                    )
            },
            withoutScalingContent: {
                Rectangle()
                    .fill(.white)
                    .frame(width: self.width, height: self.height)
                    .border(
                        state: self.state,
                        width: self.borderWidth,
                        cornerRadius: self.cornerRadius,
                        color: self.borderColor,
                        isScaled: false
                    )
            }
        )
    }
}

private extension View {

    @ViewBuilder
    func border(
        state: BorderRadiusState,
        width: CGFloat,
        cornerRadius: CGFloat,
        color: any ColorToken,
        isScaled: Bool
    ) -> some View {
        switch state {
        case .default:
            self.sparkBorder(
                width: width,
                radius: cornerRadius,
                colorToken: color,
                isScaled: isScaled
            )

        case .dashed:
            self.sparkBorder(
                width: width,
                radius: cornerRadius,
                dash: DashState.dashed.dash,
                colorToken: color,
                isScaled: isScaled
            )

        case .highlighted:
            self.sparkBorder(
                width: width,
                radius: cornerRadius,
                isHighlighted: true,
                colorToken: color,
                isScaled: isScaled
            )
        }
    }
}

