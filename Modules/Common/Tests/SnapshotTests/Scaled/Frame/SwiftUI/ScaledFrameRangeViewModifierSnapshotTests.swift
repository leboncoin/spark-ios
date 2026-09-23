//
//  ScaledFrameRangeViewModifierSnapshotTests.swift
//  SparkCommon
//
//  Created by robin.lemaire on 11/04/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import XCTest
@testable import SparkCommon
@_spi(SI_SPI) @testable import SparkCommonSnapshotTesting
import SparkTheme
import SparkTheming

final class ScaledFrameRangeViewModifierSnapshotTests: SwiftUIComponentSnapshotTestCase {

    // MARK: - Tests

    func test() throws {
        self.assertSnapshot(
            matching: SnapshotView(),
            modes: ComponentSnapshotTestConstants.Modes.default,
            sizes: ComponentSnapshotTestConstants.Sizes.all
        )
    }
}

// MARK: - View

private struct SnapshotView: View {

    // MARK: - Properties

    let width: CGFloat = 90
    let minWidth: CGFloat = 80
    let maxWidth: CGFloat = 100
    @ScaledMetric var scaledWidth: CGFloat = 0
    @ScaledMetric var scaledMinWidth: CGFloat = 0
    @ScaledMetric var scaledMaxWidth: CGFloat = 0

    let height: CGFloat = 30
    let minHeight: CGFloat = 20
    let maxHeight: CGFloat = 40
    @ScaledMetric var scaledHeight: CGFloat = 0
    @ScaledMetric var scaledMinHeight: CGFloat = 0
    @ScaledMetric var scaledMaxHeight: CGFloat = 0

    // MARK: - Initialization

    init() {
        self._scaledWidth = .init(wrappedValue: self.width)
        self._scaledMinWidth = .init(wrappedValue: self.minWidth)
        self._scaledMaxWidth = .init(wrappedValue: self.maxWidth)
        self._scaledHeight = .init(wrappedValue: self.height)
        self._scaledMinHeight = .init(wrappedValue: self.minHeight)
        self._scaledMaxHeight = .init(wrappedValue: self.maxHeight)
    }

    // MARK: - View

    var body: some View {
        ScaledSnapshotView(
            scaledContent: {
                Rectangle()
                    .fill(.white)
                    .sparkFrame(width: self.width, height: self.height)
                    .sparkFrame(
                        minWidth: self.minWidth,
                        maxWidth: self.maxWidth,
                        minHeight: self.minHeight,
                        maxHeight: self.maxHeight
                    )
            },
            scaledMetricContent: {
                Rectangle()
                    .fill(.white)
                    .frame(width: self.scaledWidth, height: self.scaledHeight)
                    .frame(
                        minWidth: self.scaledMinWidth,
                        maxWidth: self.scaledMaxWidth,
                        minHeight: self.scaledMinHeight,
                        maxHeight: self.scaledMaxHeight
                    )
            },
            withoutScalingContent: {
                Rectangle()
                    .fill(.white)
                    .frame(width: self.width, height: self.height)
                    .frame(
                        minWidth: self.minWidth,
                        maxWidth: self.maxWidth,
                        minHeight: self.minHeight,
                        maxHeight: self.maxHeight
                    )
            }
        )
    }
}
