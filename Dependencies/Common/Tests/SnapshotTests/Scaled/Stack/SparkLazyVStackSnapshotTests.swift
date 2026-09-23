//
//  SparkLazyVStackSnapshotTests.swift
//  SparkCommon
//
//  Created by robin.lemaire on 30/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import XCTest
@testable import SparkCommon
@_spi(SI_SPI) @testable import SparkCommonSnapshotTesting
import SparkTheme
import SparkTheming

final class SparkLazyVStackSnapshotTests: SwiftUIComponentSnapshotTestCase {

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

    let width: CGFloat = 25
    let height: CGFloat = 25

    let spacing: CGFloat = 10
    @ScaledMetric var scaledSpacing: CGFloat = 0

    // MARK: - Initialization

    init() {
        self._scaledSpacing = .init(wrappedValue: self.spacing)
    }

    // MARK: - View

    var body: some View {
        ScaledSnapshotView(
            backgroundOnContent: true,
            scaledContent: {
                SparkLazyVStack(spacing: self.spacing) {
                    self.content()
                }
            },
            scaledMetricContent: {
                VStack(spacing: self.scaledSpacing) {
                    self.content()
                }
            },
            withoutScalingContent: {
                VStack(spacing: self.spacing) {
                    self.content()
                }
            }
        )
    }

    @ViewBuilder private func content() -> some View {
        ForEach(0..<3) { _ in
            Rectangle()
                .fill(.white)
                .frame(width: self.width, height: self.height)
        }
    }
}
