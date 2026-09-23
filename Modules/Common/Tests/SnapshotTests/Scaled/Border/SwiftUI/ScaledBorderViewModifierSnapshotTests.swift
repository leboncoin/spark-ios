//
//  ScaledBorderViewModifierSnapshotTests.swift
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

final class ScaledBorderViewModifierSnapshotTests: SwiftUIComponentSnapshotTestCase {

    // MARK: - Tests

    func test_default() throws {
        self.assertSnapshot(
            matching: SnapshotView(state: .default),
            modes: ComponentSnapshotTestConstants.Modes.default,
            sizes: ComponentSnapshotTestConstants.Sizes.all
        )
    }

    func test_dashed() throws {
        self.assertSnapshot(
            matching: SnapshotView(state: .dashed),
            modes: ComponentSnapshotTestConstants.Modes.default,
            sizes: ComponentSnapshotTestConstants.Sizes.all
        )
    }
}

// MARK: - View

private struct SnapshotView: View {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared
    @ScaledMetric var width: CGFloat = 90
    @ScaledMetric var height: CGFloat = 20

    let state: BorderRadiusState

    let borderWidth: CGFloat
    @ScaledMetric var scaledBorderWidth: CGFloat = 0

    let borderColor: any ColorToken

    // MARK: - Initialization

    init(
        state: BorderRadiusState
    ) {
        self.state = state

        self.borderWidth = self.theme.border.width.medium
        self._scaledBorderWidth = .init(wrappedValue: self.borderWidth)
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
        color: any ColorToken,
        isScaled: Bool
    ) -> some View {
        self.sparkBorder(
            width: width,
            dash: state == .dashed ? DashState.dashed.dash : nil,
            colorToken: color,
            isScaled: isScaled
        )
    }
}

