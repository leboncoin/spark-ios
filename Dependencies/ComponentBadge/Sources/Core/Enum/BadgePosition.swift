//
//  BadgePosition.swift
//  SparkComponentBadge
//
//  Created by louis.borlee on 16/06/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

/// The various position a badge may have. where the ``BadgeView`` can be attached on another view
public enum BadgePosition: CaseIterable {
    /// Attach a badge on the top right corner of the view.
    ///
    /// ## Rendering
    ///
    /// ![Component rendering.](badge_with_value_attach_topTrailingCorner.png)
    case topTrailingCorner

    /// Attach a badge on the right of the view.
    ///
    /// ## Rendering
    ///
    /// ![Component rendering.](badge_with_value_attach_topTrailingCorner.png)
    case trailing
}
