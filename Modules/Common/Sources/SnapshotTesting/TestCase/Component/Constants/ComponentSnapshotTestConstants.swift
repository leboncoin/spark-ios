//
//  ComponentSnapshotTestConstants.swift
//  SparkSnapshotTesting
//
//  Created by robin.lemaire on 06/10/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import UIKit

/// The constants shared by all the component snapshot tests.
@_spi(SI_SPI) public enum ComponentSnapshotTestConstants {

    // MARK: Public Properties

    /// Set to *true* to record new snapshots instead of comparing them.
    public static let record = false
    /// The time to wait before taking a snapshot.
    public static let timeout: TimeInterval = 5

    // MARK: Internal Properties

    static let imagePrecision: Float = 0.98
    static let imagePerceptualPrecision: Float = 0.98

    // MARK: Public Sub Constants

    /// The appearance modes to snapshot.
    public enum Modes {
        /// The light and dark modes.
        public static let all: [ComponentSnapshotTestMode] = [.light, .dark]
        /// The light mode only.
        public static let `default`: [ComponentSnapshotTestMode] = [.light]
    }

    /// The content size categories to snapshot.
    public enum Sizes {
        /// The smallest, default and largest accessibility sizes.
        public static let all: [UIContentSizeCategory] = [.extraSmall, .large, .accessibilityExtraExtraExtraLarge]
        /// The default size only.
        public static let `default`: [UIContentSizeCategory] = [.large]
    }
}
