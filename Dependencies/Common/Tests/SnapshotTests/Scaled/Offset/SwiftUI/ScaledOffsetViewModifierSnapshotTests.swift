//
//  ScaledOffsetViewModifierSnapshotTests.swift
//  SparkCommon
//
//  Created by robin.lemaire on 02/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import XCTest
@testable import SparkCommon
@_spi(SI_SPI) @testable import SparkCommonSnapshotTesting
import SparkTheme
import SparkTheming

final class ScaledOffsetViewModifierSnapshotTests: SwiftUIComponentSnapshotTestCase {

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

    let x: CGFloat = 5
    @ScaledMetric var scaledX: CGFloat = 0
    let y: CGFloat = 5
    @ScaledMetric var scaledY: CGFloat = 0

    // MARK: - Initialization

    init() {
        self._scaledX = .init(wrappedValue: self.x)
        self._scaledY = .init(wrappedValue: self.y)
    }

    // MARK: - View

    var body: some View {
        ScaledSnapshotView(
            backgroundOnContent: true,
            scaledContent: {
                VStack {
                    Rectangle()
                        .fill(.yellow)
                        .background(.orange)

                    Rectangle()
                        .fill(.blue)
                        .sparkOffset(x: self.x, y: self.y)

                    Rectangle()
                        .fill(.green)
                        .sparkOffset(.init(
                            width: -self.x,
                            height: -self.y
                        ))
                }
                .frame(width: self.width, height: self.height)
            },
            scaledMetricContent: {
                VStack {
                    Rectangle()
                        .fill(.yellow)
                        .background(.orange)

                    Rectangle()
                        .fill(.blue)
                        .sparkOffset(x: self.scaledX, y: self.scaledY)

                    Rectangle()
                        .fill(.green)
                        .sparkOffset(.init(
                            width: -self.scaledX,
                            height: -self.scaledY
                        ))
                }
                .frame(width: self.width, height: self.height)
            },
            withoutScalingContent: {
                VStack {
                    Rectangle()
                        .fill(.yellow)
                        .background(.orange)

                    Rectangle()
                        .fill(.blue)
                        .sparkOffset(x: self.x, y: self.y)

                    Rectangle()
                        .fill(.green)
                        .sparkOffset(.init(
                            width: -self.x,
                            height: -self.y
                        ))
                }
                .frame(width: self.width, height: self.height)
            }
        )
    }
}
