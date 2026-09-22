//
//  View+FrameSizeExtensionSnapshotTests.swift
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

final class ViewFrameSizeExtensionSnapshotTests: SwiftUIComponentSnapshotTestCase {

    // MARK: - Tests

    func test() throws {
        self.assertSnapshot(
            matching: SnapshotView(),
            modes: ComponentSnapshotTestConstants.Modes.default,
            sizes: ComponentSnapshotTestConstants.Sizes.default
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
