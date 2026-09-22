//
//  ScaledCornerRadiusViewModifierSnapshotTests.swift
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

final class ScaledCornerRadiusViewModifierSnapshotTests: SwiftUIComponentSnapshotTestCase {

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
    @ScaledMetric var width: CGFloat = 90
    @ScaledMetric var height: CGFloat = 20

    let state: BorderRadiusState

    let cornerRadius: CGFloat
    @ScaledMetric var scaledCornerRadius: CGFloat = 0

    let borderColor: any ColorToken

    // MARK: - Initialization

    init(
        state: BorderRadiusState,
        cornerRadius: CGFloat
    ) {
        self.state = state

        self.cornerRadius = cornerRadius
        self._scaledCornerRadius = .init(wrappedValue: self.cornerRadius)
        self.borderColor = self.theme.colors.main.main
    }

    // MARK: - View

    var body: some View {
        ScaledSnapshotView(
            scaledContent: {
                Rectangle()
                    .fill(.white)
                    .frame(width: self.width, height: self.height)
                    .cornerRadius(
                        state: self.state,
                        cornerRadius: self.cornerRadius,
                        isScaled: true
                    )
            },
            scaledMetricContent: {
                Rectangle()
                    .fill(.white)
                    .frame(width: self.width, height: self.height)
                    .cornerRadius(
                        state: self.state,
                        cornerRadius: self.scaledCornerRadius,
                        isScaled: false
                    )
            },
            withoutScalingContent: {
                Rectangle()
                    .fill(.white)
                    .frame(width: self.width, height: self.height)
                    .cornerRadius(
                        state: self.state,
                        cornerRadius: self.cornerRadius,
                        isScaled: false
                    )
            }
        )
    }
}

private extension View {

    @ViewBuilder
    func cornerRadius(
        state: BorderRadiusState,
        cornerRadius: CGFloat,
        isScaled: Bool
    ) -> some View {
        self.sparkCornerRadius(
            cornerRadius,
            isHighlighted: state == .highlighted,
            isScaled: isScaled
        )
    }
}

