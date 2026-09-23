//
//  UIKitComponentSnapshotTestCase.swift
//  SparkCoreSnapshotTests
//
//  Created by robin.lemaire on 06/10/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SwiftUI
import UIKit
@_implementationOnly import SnapshotTesting

@_spi(SI_SPI) open class UIKitComponentSnapshotTestCase: SnapshotTestCase {

    // MARK: - Snapshot Testing

    public func assertSnapshot(
        matching view: @autoclosure () -> some UIView,
        named name: String? = nil,
        modes: [ComponentSnapshotTestMode],
        sizes: [UIContentSizeCategory],
        record recording: Bool = ComponentSnapshotTestConstants.record,
        delay: TimeInterval = 0,
        timeout: TimeInterval = ComponentSnapshotTestConstants.timeout,
        file: StaticString = #file,
        testName: String = #function,
        line: UInt = #line
    ) {
        for mode in modes {
            for size in sizes {
                sparkAssertSnapshot(
                    matching: view(),
                    as: .wait(
                        for: delay,
                        on: .image(
                            precision: ComponentSnapshotTestConstants.imagePrecision,
                            perceptualPrecision: ComponentSnapshotTestConstants.imagePerceptualPrecision,
                            traits: ComponentSnapshotTestHelpers.traitCollection(
                                mode: mode,
                                size: size
                            )
                        )
                    ),
                    named: ComponentSnapshotTestHelpers.name(
                        name,
                        mode: mode,
                        size: size
                    ),
                    record: recording,
                    timeout: timeout,
                    file: file,
                    testName: testName,
                    line: line
                )
            }
        }
    }
}
