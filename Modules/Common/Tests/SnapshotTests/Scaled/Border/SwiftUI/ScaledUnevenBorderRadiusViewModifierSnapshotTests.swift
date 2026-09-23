//
//  ScaledUnevenBorderRadiusViewModifierSnapshotTests.swift
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

final class ScaledUnevenBorderRadiusViewModifierSnapshotTests: SwiftUIComponentSnapshotTestCase {

    // MARK: - Tests

    func test_default() throws {
        for type in UnevenBorderType.allCases {
            self.assertSnapshot(
                matching: SnapshotView(
                    type: type,
                    state: .default
                ),
                modes: ComponentSnapshotTestConstants.Modes.default,
                sizes: ComponentSnapshotTestConstants.Sizes.all,
                testName: #function + "\(type)Type"
            )
        }
    }

    func test_highlighted() throws {
        for type in UnevenBorderType.allCases {
            self.assertSnapshot(
                matching: SnapshotView(
                    type: type,
                    state: .highlighted
                ),
                modes: ComponentSnapshotTestConstants.Modes.default,
                sizes: ComponentSnapshotTestConstants.Sizes.all,
                testName: #function + "\(type)Type"
            )
        }
    }
}

// MARK: - View

private struct SnapshotView: View {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    let type: UnevenBorderType
    let state: BorderRadiusState

    @ScaledMetric var width: CGFloat = 90
    @ScaledMetric var height: CGFloat = 20

    let borderWidth: CGFloat
    @ScaledMetric var scaledBorderWidth: CGFloat = 0

    let cornerRadius1: CGFloat = 12
    @ScaledMetric var scaledCornerRadius1: CGFloat = 0
    let cornerRadius2: CGFloat = 18
    @ScaledMetric var scaledCornerRadius2: CGFloat = 0

    let borderColor: any ColorToken

    // MARK: - Initialization

    init(
        type: UnevenBorderType,
        state: BorderRadiusState
    ) {
        self.type = type
        self.state = state

        self.borderWidth = self.theme.border.width.medium
        self._scaledBorderWidth = .init(wrappedValue: self.borderWidth)

        self._scaledCornerRadius1 = .init(wrappedValue: self.cornerRadius1)
        self._scaledCornerRadius2 = .init(wrappedValue: self.cornerRadius2)

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
                        type: self.type,
                        state: self.state,
                        width: self.borderWidth,
                        cornerRadius1: self.cornerRadius1,
                        cornerRadius2: self.cornerRadius2,
                        color: self.borderColor,
                        isScaled: true
                    )
            },
            scaledMetricContent: {
                Rectangle()
                    .fill(.white)
                    .frame(width: self.width, height: self.height)
                    .border(
                        type: self.type,
                        state: self.state,
                        width: self.scaledBorderWidth,
                        cornerRadius1: self.scaledCornerRadius1,
                        cornerRadius2: self.scaledCornerRadius2,
                        color: self.borderColor,
                        isScaled: false
                    )
            },
            withoutScalingContent: {
                Rectangle()
                    .fill(.white)
                    .frame(width: self.width, height: self.height)
                    .border(
                        type: self.type,
                        state: self.state,
                        width: self.borderWidth,
                        cornerRadius1: self.cornerRadius1,
                        cornerRadius2: self.cornerRadius2,
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
        type: UnevenBorderType,
        state: BorderRadiusState,
        width: CGFloat,
        cornerRadius1: CGFloat,
        cornerRadius2: CGFloat,
        color: any ColorToken,
        isScaled: Bool
    ) -> some View {
        switch type {
        case .allCorners:
            self.sparkBorder(
                width: width,
                topLeadingRadius: cornerRadius1,
                topTrailingRadius: cornerRadius2,
                bottomTrailingRadius: cornerRadius1 * 0.5,
                bottomLeadingRadius: cornerRadius2 * 0.5,
                isHighlighted: state == .highlighted,
                colorToken: color,
                isScaled: isScaled
            )
        case .verticalCorners:
            self.sparkBorder(
                width: width,
                topRadius: cornerRadius1,
                bottomRadius: cornerRadius2,
                isHighlighted: state == .highlighted,
                colorToken: color,
                isScaled: isScaled
            )
        case .horizontalCorners:
            self.sparkBorder(
                width: width,
                leadingRadius: cornerRadius1,
                trailingRadius: cornerRadius2,
                isHighlighted: state == .highlighted,
                colorToken: color,
                isScaled: isScaled
            )
        }
    }
}

