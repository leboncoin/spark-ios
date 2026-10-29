//
//  SparkColorSnapshotTests.swift
//  SparkCoreTests
//
//  Created by janniklas.freundt.ext on 13.04.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SwiftUI
import Testing
@_spi(SI_SPI) @testable import SparkCommon
@_spi(SI_SPI) @testable import SparkCommonSnapshotTesting
@testable import SparkTheme
@testable import SparkTheming

@MainActor
@Suite(.sparkConfiguration)
struct ColorSnapshotTests {
    let colors = SparkTheme.shared.colors

    @Test("Base colors") func test_base_colors() async throws {
        let mirror = Mirror(reflecting: self.colors.base)
        await self.testAllColors(colors: self.getColors(for: mirror))
    }

    @Test("Feedback colors") func test_feedback_colors() async throws {
        let mirror = Mirror(reflecting: self.colors.feedback)
        await self.testAllColors(colors: self.getColors(for: mirror))
    }

    @Test("Main colors") func test_main_colors() async throws {
        let mirror = Mirror(reflecting: self.colors.main)
        await self.testAllColors(colors: self.getColors(for: mirror))
    }

    @Test("Support colors") func test_support_colors() async throws {
        let mirror = Mirror(reflecting: self.colors.support)
        await self.testAllColors(colors: self.getColors(for: mirror))
    }

    @Test("State colors") func test_state_colors() async throws {
        let mirror = Mirror(reflecting: self.colors.states)
        await self.testAllColors(colors: self.getColors(for: mirror))
    }

    private func testAllColors(colors: [String: any ColorToken], testName: String = #function) async {
        for value in colors {
            let view = Spacer().background(value.value.color)
            let vc = UIHostingController(rootView: view)
            vc.view.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
            vc.overrideUserInterfaceStyle = .light
            await sparkExpectSnapshot(
                matching: vc.view,
                as: .image,
                named: value.key,
                testName: testName
            )

            vc.overrideUserInterfaceStyle = .dark
            await sparkExpectSnapshot(
                matching: vc.view,
                as: .image,
                named: value.key + "-dark",
                testName: testName
            )
        }
    }

    private func getColors(for mirror: Mirror) -> [String: any ColorToken] {
        var dictionary: [String: any ColorToken] = [:]
        for child in mirror.children {
            guard let label = child.label, let color = child.value as? (any ColorToken) else { continue }

            dictionary[label] = color
        }

        return dictionary
    }
}
