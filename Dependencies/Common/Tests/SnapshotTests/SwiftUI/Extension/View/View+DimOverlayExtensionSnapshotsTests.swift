//
//  View+DimOverlayExtensionSnapshotsTests.swift
//  SparkCommon
//
//  Created by robin.lemaire on 22/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import XCTest
@_spi(SI_SPI) @testable import SparkCommon
@_spi(SI_SPI) @testable import SparkCommonSnapshotTesting
import SparkTheme
import SparkTheming

final class ViewDimOverlayExtensionSnapshotsTests: SwiftUIComponentSnapshotTestCase {

    // MARK: - Tests

    func test_with_dim() throws {
        self.assertSnapshot(
            matching: SnapshotView(dim: 0.5),
            modes: ComponentSnapshotTestConstants.Modes.default,
            sizes: ComponentSnapshotTestConstants.Sizes.default
        )
    }

    func test_without_dim() throws {
        self.assertSnapshot(
            matching: SnapshotView(dim: 1),
            modes: ComponentSnapshotTestConstants.Modes.default,
            sizes: ComponentSnapshotTestConstants.Sizes.default
        )
    }
}

// MARK: - View

private struct SnapshotView: View {

    // MARK: - Properties

    let dim: CGFloat

    // MARK: - View

    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)

            Text("Dimmed !")
        }

            .dimmedOverlay(self.dim) {
                Color.white
            }
            .frame(size: 100)
    }
}
