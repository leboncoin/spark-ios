//
//  SnapshotTraitsBuilder.swift
//  SparkSnapshotTesting
//
//  Created by robin.lemaire on 06/10/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import UIKit

enum SnapshotTraitsBuilder {

    // MARK: - Methods

    static func make(
        mode: ComponentSnapshotTestMode,
        size: UIContentSizeCategory
    ) -> UITraitCollection {
        return UITraitCollection(traitsFrom: [
            mode.traitCollection,
            UITraitCollection(preferredContentSizeCategory: size)
        ])
    }
}
