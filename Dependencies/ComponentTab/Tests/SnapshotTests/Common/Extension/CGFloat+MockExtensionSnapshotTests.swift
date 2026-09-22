//
//  CGFloat+MockExtensionSnapshotTests.swift
//  SparkComponentTab
//
//  Created by robin.lemaire on 10/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

extension CGFloat {

    static func width(apportionsSegmentWidthsByContent: Bool) -> Self {
        return apportionsSegmentWidthsByContent ? 200 : 400
    }
}
