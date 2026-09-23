//
//  ScaledUnevenCornerRadiusViewModifierSnapshotTests.swift
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

final class ScaledUnevenCornerRadiusViewModifierSnapshotTests: SwiftUIComponentSnapshotTestCase {

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
    @ScaledMetric var width: CGFloat = 90
    @ScaledMetric var height: CGFloat = 20

    let type: UnevenBorderType
    let state: BorderRadiusState

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
                    .cornerRadius(
                        type: self.type,
                        state: self.state,
                        cornerRadius1: self.cornerRadius1,
                        cornerRadius2: self.cornerRadius2,
                        isScaled: true
                    )
            },
            scaledMetricContent: {
                Rectangle()
                    .fill(.white)
                    .frame(width: self.width, height: self.height)
                    .cornerRadius(
                        type: self.type,
                        state: self.state,
                        cornerRadius1: self.scaledCornerRadius1,
                        cornerRadius2: self.scaledCornerRadius2,
                        isScaled: false
                    )
            },
            withoutScalingContent: {
                Rectangle()
                    .fill(.white)
                    .frame(width: self.width, height: self.height)
                    .cornerRadius(
                        type: self.type,
                        state: self.state,
                        cornerRadius1: self.cornerRadius1,
                        cornerRadius2: self.cornerRadius2,
                        isScaled: false
                    )
            }
        )
    }
}

private extension View {

    @ViewBuilder
    func cornerRadius(
        type: UnevenBorderType,
        state: BorderRadiusState,
        cornerRadius1: CGFloat,
        cornerRadius2: CGFloat,
        isScaled: Bool
    ) -> some View {
        switch type {
        case .allCorners:
            self.sparkCornerRadius(
                topLeading: cornerRadius1,
                topTrailing: cornerRadius1,
                bottomTrailing: cornerRadius1 * 0.5,
                bottomLeading: cornerRadius2 * 0.5,
                isHighlighted: state == .highlighted,
                isScaled: isScaled
            )
        case .verticalCorners:
            self.sparkCornerRadius(
                top: cornerRadius1,
                bottom: cornerRadius2,
                isHighlighted: state == .highlighted,
                isScaled: isScaled
            )
        case .horizontalCorners:
            self.sparkCornerRadius(
                leading: cornerRadius1,
                trailing: cornerRadius2,
                isHighlighted: state == .highlighted,
                isScaled: isScaled
            )
        }
    }
}

