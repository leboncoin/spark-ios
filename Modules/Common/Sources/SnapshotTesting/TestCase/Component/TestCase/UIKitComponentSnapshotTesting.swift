//
//  UIKitComponentSnapshotTesting.swift
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
@_spi(SI_SPI) @MainActor public protocol UIKitComponentSnapshotTesting {
}

// MARK: - Snapshot Testing

@_spi(SI_SPI) public extension UIKitComponentSnapshotTesting {

    /// Asserts the snapshots of a UIKit view, one per mode and size.
    ///
    /// - Parameters:
    ///   - view: The UIKit view to snapshot (recreated for each mode and size).
    ///   - name: An optional name added to the snapshot file name.
    ///   - modes: The modes (light, dark, ...) to snapshot.
    ///   - sizes: The content size categories to snapshot.
    ///   - recording: Records the snapshots instead of comparing them.
    ///   - delay: The delay to wait before taking the snapshot (e.g. for animations).
    ///   - timeout: The maximum time to wait for the snapshot.
    ///   - filePath: The file path of the test, used to find the snapshots folder.
    ///   - testName: The name of the test, used in the snapshot file name.
    ///   - sourceLocation: The source location used to report a failure.
    func assertSnapshot(
        matching view: @autoclosure () -> some UIView,
        named name: String? = nil,
        modes: [ComponentSnapshotTestMode],
        sizes: [UIContentSizeCategory],
        record recording: Bool = ComponentSnapshotTestConstants.record,
        delay: TimeInterval = 0,
        timeout: TimeInterval = ComponentSnapshotTestConstants.timeout,
        filePath: StaticString = #filePath,
        testName: String = #function,
        sourceLocation: SourceLocation = #_sourceLocation
    ) async {
        for mode in modes {
            for size in sizes {
                await sparkExpectSnapshot(
                    matching: view(),
                    as: .wait(
                        for: delay,
                        on: .image(
                            precision: ComponentSnapshotTestConstants.imagePrecision,
                            perceptualPrecision: ComponentSnapshotTestConstants.imagePerceptualPrecision,
                            traits: SnapshotTraitsBuilder.make(
                                mode: mode,
                                size: size
                            )
                        )
                    ),
                    named: SnapshotNameBuilder.make(
                        name,
                        mode: mode,
                        size: size
                    ),
                    record: recording,
                    timeout: timeout,
                    filePath: filePath,
                    testName: testName,
                    sourceLocation: sourceLocation
                )
            }
        }
    }
}
