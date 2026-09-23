//
//  TabApportionsSegmentWidthsByContentEnvironmentValues.swift
//  SparkComponentTab
//
//  Created by robin.lemaire on 23/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var tabApportionsSegmentWidthsByContent: Bool = false
}

public extension View {

    /// A Boolean value that controls whether the width of segments is proportioned based on content.
    /// When `true`, segments are sized proportionally to their content.
    /// When `false`, all segments have equal width.
    ///
    /// The default value for this property is *true*.
    func sparkTabApportionsSegmentWidthsByContent(_ apportionsSegmentWidthsByContent: Bool) -> some View {
        self.environment(\.tabApportionsSegmentWidthsByContent, apportionsSegmentWidthsByContent)
    }
}
