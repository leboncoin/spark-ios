//
//  View+DimOverlayExtensionSnapshotsTests.swift
//  SparkCommon
//
//  Created by robin.lemaire on 22/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import Testing
@_spi(SI_SPI) @testable import SparkCommon
@_spi(SI_SPI) @testable import SparkCommonSnapshotTesting
import SparkTheme
import SparkTheming

@MainActor
@Suite(.sparkConfiguration)
struct ViewDimOverlayExtensionSnapshotsTests: SwiftUIComponentSnapshotTesting {

    // MARK: - Tests

    @Test func test_with_dim() throws {
        self.assertSnapshot(
            matching: SnapshotView(dim: 0.5),
            modes: ComponentSnapshotTestConstants.Modes.default,
            sizes: ComponentSnapshotTestConstants.Sizes.default,
            addPadding: false
        )
    }

    @Test func test_without_dim() throws {
        self.assertSnapshot(
            matching: SnapshotView(dim: 1),
            modes: ComponentSnapshotTestConstants.Modes.default,
            sizes: ComponentSnapshotTestConstants.Sizes.default,
            addPadding: false
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
