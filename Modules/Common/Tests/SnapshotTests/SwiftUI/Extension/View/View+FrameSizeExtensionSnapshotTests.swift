//
//  View+FrameSizeExtensionSnapshotTests.swift
//  SparkCommon
//
//  Created by robin.lemaire on 22/10/2025.
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
struct ViewFrameSizeExtensionSnapshotTests: SwiftUIComponentSnapshotTesting {

    // MARK: - Tests

    @Test("View+Frame size extension snapshot") func test() async throws {
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

    let size: CGFloat = 90
    let minSize: CGFloat = 80
    let maxSize: CGFloat = 100

    // MARK: - View

    var body: some View {
        Rectangle()
            .fill(.white)
            .sparkFrame(size: self.size)
            .padding(20)
            .background(.gray)
    }
}
