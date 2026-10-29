//
//  View+FrameRangeSizeExtensionSnapshotTests.swift
//  SparkCommon
//
//  Created by robin.lemaire on 11/04/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import Testing
@testable import SparkCommon
@_spi(SI_SPI) @testable import SparkCommonSnapshotTesting
import SparkTheme
import SparkTheming

@MainActor
@Suite(.sparkConfiguration)
struct ViewFrameRangeSizeExtensionSnapshotTests: SwiftUIComponentSnapshotTesting {

    // MARK: - Tests

    @Test("View+Frame range size extension snapshot") func test() async throws {
        await self.assertSnapshot(
            matching: SnapshotView(),
            modes: ComponentSnapshotTestConstants.Modes.default,
            sizes: ComponentSnapshotTestConstants.Sizes.default,
            addPadding: false
        )
    }
}

// MARK: - View

private struct SnapshotView: View {

    // MARK: - Properties

    let minSize: CGFloat = 150
    let maxSize: CGFloat = 200

    // MARK: - View

    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Text("Min")
                .style(
                    size: 130,
                    minSize: self.minSize,
                    maxSize: self.maxSize
                )

            Text("In range")
                .style(
                    size: 175,
                    minSize: self.minSize,
                    maxSize: self.maxSize
                )

            Text("Max")
                .style(
                    size: 220,
                    minSize: self.minSize,
                    maxSize: self.maxSize
                )
        }
        .padding(20)
        .background(.gray)
    }
}

// MARK: - Extension

private extension View {

    func style(size: CGFloat, minSize: CGFloat, maxSize: CGFloat) -> some View {
        self
            .background(.white)
            .sparkFrame(size: size)
            .sparkFrame(
                minSize: minSize,
                maxSize: maxSize
            )
            .fixedSize()
            .background(.black)
    }
}
