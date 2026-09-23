//
//  ScaledPaddingInsetsViewModifierSnapshotTests.swift
//  SparkCommon
//
//  Created by robin.lemaire on 20/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import XCTest
@testable import SparkCommon
@_spi(SI_SPI) @testable import SparkCommonSnapshotTesting
import SparkTheme
import SparkTheming

final class ScaledPaddingInsetsViewModifierSnapshotTests: SwiftUIComponentSnapshotTestCase {

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

    let width: CGFloat = 50
    let height: CGFloat = 50

    let insets: EdgeInsets = .init(top: 20, leading: 20, bottom: 20, trailing: 20)

    // MARK: - View

    var body: some View {
        ScaledSnapshotView(
            backgroundOnContent: true,
            scaledContent: {
                Rectangle()
                    .fill(.white)
                    .frame(width: self.width, height: self.height)
                    .sparkPadding(self.insets)
                    .background(.orange)
            },
            scaledMetricContent: {
                EmptyView()
            },
            withoutScalingContent: {
                Rectangle()
                    .fill(.white)
                    .frame(width: self.width, height: self.height)
                    .padding(self.insets)
                    .background(.orange)
            }
        )
    }
}
