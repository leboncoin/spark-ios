//
//  ScaledBorderViewModifierPositionSnapshotTests.swift
//  SparkCommon
//
//  Created by robin.lemaire on 01/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import XCTest
@testable import SparkCommon
@_spi(SI_SPI) @testable import SparkCommonSnapshotTesting
import SparkTheme
import SparkTheming

final class ScaledBorderViewModifierPositionSnapshotTests: SwiftUIComponentSnapshotTestCase {

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

    private let theme: any Theme = SparkTheme.shared
    @ScaledMetric var width: CGFloat = 90
    @ScaledMetric var height: CGFloat = 20

    let borderWidth: CGFloat
    @ScaledMetric var scaledBorderWidth: CGFloat = 0

    let borderColor: any ColorToken

    // MARK: - Initialization

    init() {
        self.borderWidth = self.theme.border.width.medium
        self._scaledBorderWidth = .init(wrappedValue: self.borderWidth)
        self.borderColor = self.theme.colors.main.main
    }

    // MARK: - View

    var body: some View {
        ScaledSnapshotView(
            scaledContent: {
                ForEach(BorderPosition.allCases, id: \.rawValue) { position in
                    Text(position.rawValue.capitalized)
                        .padding(4)
                        .frame(width: self.width, height: self.height)
                        .background(.white)
                        .sparkBorder(
                            width: self.borderWidth,
                            colorToken: self.borderColor,
                            position: position
                        )
                }
            },
            scaledMetricContent: {
                ForEach(BorderPosition.allCases, id: \.rawValue) { position in
                    Text(position.rawValue.capitalized)
                        .padding(4)
                        .frame(width: self.width, height: self.height)
                        .background(.white)
                        .sparkBorder(
                            width: self.scaledBorderWidth,
                            colorToken: self.borderColor,
                            position: position,
                            isScaled: false
                        )
                }
            },
            withoutScalingContent: {
                ForEach(BorderPosition.allCases, id: \.rawValue) { position in
                    Text(position.rawValue.capitalized)
                        .padding(4)
                        .frame(width: self.width, height: self.height)
                        .background(.white)
                        .sparkBorder(
                            width: self.borderWidth,
                            colorToken: self.borderColor,
                            position: position,
                            isScaled: false
                        )
                }
            }
        )
    }
}
