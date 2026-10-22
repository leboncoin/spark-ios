//
//  SwiftUIComponentSnapshotTesting.swift
//  SparkCoreSnapshotTests
//
//  Created by robin.lemaire on 20/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import UIKit
import Testing
import SparkTheme
@_implementationOnly import SnapshotTesting

/// The suite must be in a file named like the suite (the snapshots folder uses the file name).
@_spi(SI_SPI) @MainActor public protocol SwiftUIComponentSnapshotTesting {
}

// MARK: - Snapshot Testing

@_spi(SI_SPI) public extension SwiftUIComponentSnapshotTesting {

    func assertSnapshot(
        matching view: @autoclosure () -> some View,
        named name: String? = nil,
        modes: [ComponentSnapshotTestMode],
        sizes: [UIContentSizeCategory],
        record recording: Bool = ComponentSnapshotTestConstants.record,
        timeout: TimeInterval = ComponentSnapshotTestConstants.timeout,
        filePath: StaticString = #filePath,
        testName: String = #function,
        sourceLocation: SourceLocation = #_sourceLocation,
        addPadding: Bool = true,
        forDocumentation: Bool = false
    ) {
        let modes = forDocumentation ? ComponentSnapshotTestConstants.Modes.all : modes
        let sizes = forDocumentation ? [.large] : sizes

        for mode in modes {
            for size in sizes {
                let snapshotView = view()
                    .environment(\.sizeCategory, ContentSizeCategory(size) ?? .extraSmall)
                    .padding(addPadding: addPadding, size: size)

                let traits = SnapshotTraitsBuilder.make(
                    mode: mode,
                    size: size
                )

                sparkExpectSnapshot(
                    matching: snapshotView,
                    as: .image(
                        precision: ComponentSnapshotTestConstants.imagePrecision,
                        perceptualPrecision: ComponentSnapshotTestConstants.imagePerceptualPrecision,
                        traits: traits
                    ),
                    named: SnapshotNameBuilder.make(
                        name,
                        mode: mode,
                        size: size,
                        forDocumentation: forDocumentation
                    ),
                    record: recording,
                    timeout: timeout,
                    filePath: filePath,
                    testName: testName,
                    sourceLocation: sourceLocation,
                    forDocumentation: forDocumentation
                )
            }
        }
    }
}

// MARK: - Extension

private extension View {

    @ViewBuilder
    func padding(addPadding: Bool, size: UIContentSizeCategory) -> some View {
        if addPadding {
            self.padding(size.padding)
        } else {
            self
        }
    }
}
