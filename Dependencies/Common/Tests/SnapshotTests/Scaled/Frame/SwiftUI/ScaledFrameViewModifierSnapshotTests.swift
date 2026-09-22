//
//  ScaledFrameViewModifierSnapshotTests.swift
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

final class ScaledFrameViewModifierSnapshotTests: SwiftUIComponentSnapshotTestCase {

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
    let height: CGFloat = 30

    @ScaledMetric var scaledWidth: CGFloat = 0
    @ScaledMetric var scaledHeight: CGFloat = 0

    // MARK: - Initialization

    init() {
        self._scaledWidth = .init(wrappedValue: self.width)
        self._scaledHeight = .init(wrappedValue: self.height)
    }

    // MARK: - View

    var body: some View {
        ScaledSnapshotView(
            scaledContent: {
                Rectangle()
                    .fill(.white)
                    .sparkFrame(
                        width: self.width,
                        height: self.height
                    )
            },
            scaledMetricContent: {
                Rectangle()
                    .fill(.white)
                    .frame(
                        width: self.scaledWidth,
                        height: self.scaledHeight
                    )
            },
            withoutScalingContent: {
                Rectangle()
                    .fill(.white)
                    .frame(
                        width: self.width,
                        height: self.height
                    )
            }
        )
    }
}
