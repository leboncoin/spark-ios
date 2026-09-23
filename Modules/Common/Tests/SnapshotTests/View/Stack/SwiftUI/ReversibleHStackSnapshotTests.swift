//
//  ReversibleHStackSnapshotTests.swift
//  SparkCommon
//
//  Created by robin.lemaire on 28/05/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import XCTest
@_spi(SI_SPI) @testable import SparkCommon
@_spi(SI_SPI) @testable import SparkCommonSnapshotTesting

final class ReversibleHStackSnapshotTests: SwiftUIComponentSnapshotTestCase {

    // MARK: - Tests

    func test_with_default_isReversed() throws {
        // GIVEN / WHEN
        let view = ReversibleHStack(
            alignment: .center,
            spacing: 5,
            content1: {
                Text.text1
            },
            content2: {
                Text.text2
            }
        )

        self.assertSnapshot(
            matching: view.style(),
            modes: ComponentSnapshotTestConstants.Modes.default,
            sizes: ComponentSnapshotTestConstants.Sizes.all
        )
    }

    func test_when_isReversed_is_true() throws {
        // GIVEN / WHEN
        let view = ReversibleHStack(
            alignment: .top,
            spacing: 10,
            content1: {
                Text.text1
            },
            content2: {
                Text.text2
            }
        )
            .isReversed(true)

        self.assertSnapshot(
            matching: view.style(),
            modes: ComponentSnapshotTestConstants.Modes.default,
            sizes: ComponentSnapshotTestConstants.Sizes.all
        )
    }

    func test_when_isReversed_is_false() throws {
        // GIVEN / WHEN
        let view = ReversibleHStack(
            alignment: .bottom,
            spacing: 15,
            content1: {
                Text.text1
            },
            content2: {
                Text.text2
            }
        )
            .isReversed(false)

        self.assertSnapshot(
            matching: view.style(),
            modes: ComponentSnapshotTestConstants.Modes.default,
            sizes: ComponentSnapshotTestConstants.Sizes.all
        )
    }
}

// MARK: - Extension

private extension View {

    func style() -> some View {
        self.frame(width: 200, height: 100)
            .padding(20)
            .background(.gray)
    }
}

private extension Text {

    static var text1: some View {
        Text("Hey")
            .background(.orange)
    }

    static var text2: some View {
        Text("Bye")
            .background(.blue)
    }
}
