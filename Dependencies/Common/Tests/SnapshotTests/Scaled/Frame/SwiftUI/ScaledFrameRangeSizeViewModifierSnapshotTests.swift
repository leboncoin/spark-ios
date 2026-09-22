//
//  ScaledFrameRangeSizeViewModifierSnapshotTests.swift
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

final class ScaledFrameRangeSizeViewModifierSnapshotTests: SwiftUIComponentSnapshotTestCase {

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

    let size: CGFloat = 90
    let minSize: CGFloat = 80
    let maxSize: CGFloat = 100
    @ScaledMetric var scaledSize: CGFloat = 0
    @ScaledMetric var scaledMinSize: CGFloat = 0
    @ScaledMetric var scaledMaxSize: CGFloat = 0

    // MARK: - Initialization

    init() {
        self._scaledSize = .init(wrappedValue: self.size)
        self._scaledMinSize = .init(wrappedValue: self.minSize)
        self._scaledMaxSize = .init(wrappedValue: self.maxSize)
        self._scaledSize = .init(wrappedValue: self.size)
        self._scaledMinSize = .init(wrappedValue: self.minSize)
        self._scaledMaxSize = .init(wrappedValue: self.maxSize)
    }

    // MARK: - View

    var body: some View {
        ScaledSnapshotView(
            scaledContent: {
                Rectangle()
                    .fill(.white)
                    .sparkFrame(size: self.size)
                    .sparkFrame(
                        minSize: self.minSize,
                        maxSize: self.maxSize
                    )
            },
            scaledMetricContent: {
                Rectangle()
                    .fill(.white)
                    .frame(size: self.scaledSize)
                    .frame(
                        minSize: self.scaledMinSize,
                        maxSize: self.scaledMaxSize
                    )
            },
            withoutScalingContent: {
                Rectangle()
                    .fill(.white)
                    .frame(size: self.size)
                    .frame(
                        minSize: self.minSize,
                        maxSize: self.maxSize
                    )
            }
        )
    }
}
