//
//  OptionalVStackSnapshotTests.swift
//  SparkCommon
//
//  Created by robin.lemaire on 28/05/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import Testing
@testable import SparkCommon
@_spi(SI_SPI) @testable import SparkCommonSnapshotTesting

@MainActor
@Suite(.sparkConfiguration)
struct OptionalVStackSnapshotTests: SwiftUIComponentSnapshotTesting {

    // MARK: - Tests

    @Test func test_with_onStack_at_true() async throws {
        // GIVEN / WHEN
        let view = SparkOptionalVStack(
            alignment: .center,
            spacing: 8,
            onStack: true
        ) {
            Text.text1
            Text.text2
        }

        await self.assertSnapshot(
            matching: view.style(),
            modes: ComponentSnapshotTestConstants.Modes.default,
            sizes: ComponentSnapshotTestConstants.Sizes.all,
            addPadding: false
        )
    }

    @Test func test_with_onStack_at_false() async throws {
        // GIVEN / WHEN
        let view = SparkOptionalVStack(
            alignment: .center,
            spacing: 8,
            onStack: false
        ) {
            Text.text1
            Text.text2
        }

        await self.assertSnapshot(
            matching: view.style(),
            modes: ComponentSnapshotTestConstants.Modes.default,
            sizes: ComponentSnapshotTestConstants.Sizes.all,
            addPadding: false
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
