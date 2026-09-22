//
//  ScaledFrameSizeViewModifierSnapshotTests.swift
//  SparkCommon
//
//  Created by robin.lemaire on 22/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import XCTest
@testable import SparkCommon
@_spi(SI_SPI) @testable import SparkCommonSnapshotTesting
import SparkTheme
import SparkTheming

final class ScaledFrameSizeViewModifierSnapshotTests: SwiftUIComponentSnapshotTestCase {

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

    let size: CGFloat = 40

    @ScaledMetric var scaledSize: CGFloat = 0

    // MARK: - Initialization

    init() {
        self._scaledSize = .init(wrappedValue: self.size)
    }

    // MARK: - View

    var body: some View {
        ScaledSnapshotView(
            scaledContent: {
                Rectangle()
                    .fill(.white)
                    .sparkFrame(size: self.size)
            },
            scaledMetricContent: {
                Rectangle()
                    .fill(.white)
                    .frame(size: self.scaledSize)
            },
            withoutScalingContent: {
                Rectangle()
                    .fill(.white)
                    .frame(
                        size: self.size
                    )
            }
        )
    }
}
