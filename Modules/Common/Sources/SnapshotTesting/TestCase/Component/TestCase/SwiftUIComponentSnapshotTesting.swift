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
import SparkTheming
import SparkTheme
import SparkCommon
@_implementationOnly import SnapshotTesting

/// The suite must be in a file named like the suite (the snapshots folder uses the file name).
@_spi(SI_SPI) @MainActor public protocol SwiftUIComponentSnapshotTesting {
}

// MARK: - Snapshot Testing

@_spi(SI_SPI) public extension SwiftUIComponentSnapshotTesting {

    /// Asserts the snapshots of a SwiftUI view, one per mode and size.
    ///
    /// - Parameters:
    ///   - view: The SwiftUI view to snapshot (recreated for each mode and size).
    ///   - name: An optional name added to the snapshot file name.
    ///   - modes: The modes (light, dark, ...) to snapshot.
    ///   - sizes: The content size categories to snapshot.
    ///   - recording: Records the snapshots instead of comparing them.
    ///   - timeout: The maximum time to wait for the snapshot.
    ///   - filePath: The file path of the test, used to find the snapshots folder.
    ///   - testName: The name of the test, used in the snapshot file name.
    ///   - sourceLocation: The source location used to report a failure.
    ///   - addPadding: Adds a padding (depending on the size) around the view.
    ///   - reverseBackground: Displays the opposite background when the component color is too close from the default background.
    ///   - forDocumentation: Generates the DocC images (all the modes, large size only) instead of the tests snapshots.
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
        reverseBackground: Bool = false,
        forDocumentation: Bool = false
    ) async {
        let modes = forDocumentation ? ComponentSnapshotTestConstants.Modes.all : modes
        let sizes = forDocumentation ? [.large] : sizes

        for mode in modes {
            for size in sizes {
                let snapshotView = view()
                    .environment(\.sizeCategory, ContentSizeCategory(size) ?? .extraSmall)
                    .padding(addPadding: addPadding, size: size)
                    .background(reverseBackground: reverseBackground)
                    .sparkIsSnapshot(true)

                let traits = SnapshotTraitsBuilder.make(
                    mode: mode,
                    size: size
                )

                await sparkExpectSnapshot(
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

    /// Displays the opposite background when the component color is too close from the default background.
    @ViewBuilder
    func background(reverseBackground: Bool) -> some View {
        if reverseBackground {
            self.background(SparkTheme.shared.colors.base.onBackground.color)
        } else {
            self.background(.background)
        }
    }
}
